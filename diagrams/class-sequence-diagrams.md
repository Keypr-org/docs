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

---

```mermaid
classDiagram
    class RawVaultParser{
      +parseRawVault(Stream file) RawVault
      +serializeRawVault(RawVault vault) Stream
    }
    class VaultSessionParser{
      +parseVaultSession(String vaultBody) VaultSession
      +serializeVaultSession(VaultSession session) String
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
