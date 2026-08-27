# Diagrams

## Class diagrams

### `VaultRepository`

```mermaid
classDiagram
    class VaultRepository{
        +getVaultSession(String Masterpass, String filename) VaultSession
        +writeVaultSession(VaultSession session) void
        +createVault(String name, String filename, String masterpass) VaultSession
        +vaultExists(String filename) bool
    }
```

### `CryptoService`

```mermaid
classDiagram
    class CryptoService{
        +deriveKey(byte[] masterpass, byte[] salt, int opLimits, int memoryLimit) byte[]
        +authenticate(byte[] key, byte[] content) byte[]
        +encrypt(byte[] key, byte[] plaintext) byte[]
        +decrypt(byte[] key, byte[] ciphertext) String
    }
```

### `FileHandler`

```mermaid
classDiagram
    class FileHandler{
      +saveFileAtomically(String filename, Stream content) void$
      +openFile(String filename, Mode filemode) Stream$
      +fileExists(String filename) bool$
    }
```

### `VaultSession`

```mermaid
classDiagram
    class VaultSession{
      -cipherKey:byte[]
      -authKey:byte[]
      -filename:String
      +getCategories() Categories
      +parse(String vaultBody) VaultSession$
      +serialize(VaultSession session) Stream$
    }
```

### `VaultController`

```mermaid
classDiagram
    class VaultController{
      +session VaultSesssion
      +openVault(String Masterpass, String filename) bool
      +lockVault() void
      +isVaultUnlocked() bool
      +getVaultSession() const VaultSession&
      +vaultExists(String filename) bool
    }
```

### `RawVault`

```mermaid
classDiagram
    class RawVault{
      -header: VaultHeader
      -headerMAC: byte[]
      -xSalsa20Nonce: byte[]
      -poly1305MAC: byte[]
      -ciphertext:bytes[]

      -RawVault(VaultHeader header, byte[] headerMAC, byte[] xSalsa20Nonce, byte[] poly1305MAC, bytes[] ciphertext)

      +header() VaultHeader
      +headerMAC() byte[]
      +xSalsa20Nonce() byte[]
      +poly1305MAC() byte[]
      +ciphertext() bytes[]
      +parse(Stream file) RawVault$
      +serialize(RawVault rawVault) Stream$
    }

    class VaultHeader{
      -magicBytes: String
      -formatVersion: int
      -argon2KDFSalt: byte[]
      -argon2OpLimit: long long
      -argon2MemLimit: long long

      +VaultHeader(String magicBytes, int formatVersion, byte[] argon2KDFSalt, long long argon2OpLimit, long long argon2MemLimit)

      +magicBytes() String
      +formatVersion() int
      +argon2KDFSalt() byte[]
      +argon2OpLimit() long long
      +argon2MemLimit() long long
    }
```

```mermaid
classDiagram
    Entry <|-- Website
    Entry <|-- CreditCard
    Entry <|-- Wifi
    DatedItem <|-- VaultSession
    DatedItem <|-- Entry
    DatedItem <|-- Persona
    Item <|-- DatedItem
    Item <|-- Category

    class Item{
        -snowflake_t id

        +getId() snowflake_t
    }
    class VaultSession {
        -byte[] cipherKey
        -byte[] authKey
        -String name
        -Category[] categories
        -Persona[] personas

        +getCipherKey() byte[]
        +getAuthKey() byte[]
        +getName() String
        +getCategories() Category[]
        +getPersonas() Persona[]
    }
    class Entry{
        -String notes

        +getNotes() String
        +setNotes(String notes) void
    }
    class Website{
        -String title
        -String comments
        -String username
        -String password
        -String url
        -Persona persona
        -String alias

        +getTitle() String
        +getComments() String
        +getUsername() String
        +getPassword() String
        +getUrl() String
        +getPersona() Persona
        +getAlias() String
        +setComments(String comments) void
        +setUsername(String username) void
        +setPassword(String password) void
        +setUrl(String url) void
        +setPersona(Persona persona) void
        +setAlias(String alias) void
    }
    class Wifi{
        -String networkName
        -String password

        +getNetworkName() String
        +getPassword() String
        +setNetworkName(String networkName) void
        +setPassword(String password) void
    }
    class CreditCard{
        -String cardHolderName
        -String cardNumber
        -String expiration
        -String securityCode

        +getCardHolderName() String
        +getCardNumber() String
        +getExpiration() String
        +getSecurityCode() String
        +setCardHolderName(String cardHolderName) void
        +setCardNumber(String cardNumber) void
        +setExpiration(String expiration) void
        +setSecurityCode(String securityCode) void
    }
    class DatedItem{
        -DateTime createdAt
        -DateTime updatedAt

        +getCreationDate() DateTime
        +getLastUpdate() DateTime
        +setLastUpdate(DateTime) void
    }
    class Persona{
        -String firstName
        -String lastName
        -Date dateOfBirth
        -String address
        -String phone

        +getFirstName() String
        +getLastName() String
        +getDateOfBirth() String
        +getaddress() String
        +getPhone() String
        +setFirstName(String firstName) void
        +setLastName(String lastName) void
        +setDateOfBirth(Date dateOfBirth) void
        +setaddress(String address) void
        +setPhone(String phone) void
    }
    class Category {
        -String name
        -Entry[] entries

        +getName() String
        +getEntries() Entry[]
    }
```

## Sequence diagrams

### Unlock vault sequence

```mermaid
sequenceDiagram
  GUI->>+VaultController: openVault(...)
  VaultController->>+VaultRepository: getVaultSession(...)
  VaultRepository->>+FileHandler: openFile(...)
  FileHandler-->>-VaultRepository: FileStream
  VaultRepository->>+RawVault: parse(...)
  RawVault-->>-VaultRepository: RawVault
  VaultRepository->>+CryptoService: deriveKey(...)
  CryptoService-->>-VaultRepository: key
  VaultRepository->>+CryptoService: authenticate(...)
  CryptoService-->>-VaultRepository: bool
  VaultRepository->>+CryptoService: decrypt(...)
  CryptoService-->>-VaultRepository: vaultBody
  VaultRepository->>+VaultSession: parse(...)
  VaultSession-->>-VaultRepository: VaultSession
  VaultRepository-->>-VaultController: VaultSession
  VaultController-->>-GUI: bool
```

### Lock vault sequence

```mermaid
sequenceDiagram
  GUI->>+VaultController: lockVault(...)
  VaultController->>+VaultRepository: writeVaultSession(...)
  VaultRepository->>+VaultSession: serialize(...)
  VaultSession-->>-VaultRepository: vaultBody
  VaultRepository->>+CryptoService: encrypt(...)
  CryptoService-->>-VaultRepository: ciphertext
  VaultRepository->>+CryptoService: authenticate(...)
  CryptoService-->>-VaultRepository: byte[]
  VaultRepository->>+RawVault: RawVault()
  RawVault-->>-VaultRepository: RawVault
  VaultRepository->>+RawVault: serialize(...)
  RawVault-->>-VaultRepository: Stream
  VaultRepository->>+FileHandler: saveFileAtomically(...)
  FileHandler-->>-VaultRepository: void
  VaultRepository-->>-VaultController: void
  VaultController-->>-GUI: void
```

### Open a Vault

```mermaid
sequenceDiagram
  GUI->>+VaultController: openVault(...)
  VaultController->>+VaultRepository: vaultExists(...)
  VaultRepository->>+FileHandler: FileExists(...)
  FileHandler-->>-VaultRepository: bool

  alt File doesn't exist
    VaultRepository-->>VaultController: false
    VaultController-->>GUI: File not found
  else File exists
    VaultRepository->>+FileHandler: openFile(...)
    FileHandler-->>-VaultRepository: Stream

    VaultRepository->>+RawVault: parse(...)
    RawVault-->>-VaultRepository: void

    alt Parsing fails
      VaultRepository-->>VaultController: Parsing failed
      VaultController-->>GUI: Invalid vault file
    else Parsing succeeds
      VaultRepository-->>-VaultController: true
      VaultController-->>-GUI: Vault opened
    end
  end
```
