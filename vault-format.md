# Vault file format specification

This document describes how the *Keypr* vault format is structured. A vault is the file that contains the encrypted entries (website credentials, wifi credentials, credit card information, personas, email aliases). 

This vault format is inspired of [keepass database format](https://keepass.info/help/kb/kdbx.html#xml).

## General specification

In the whole document:

- Integers are stored in little-endian byte order
- Strings are stored in UTF-8 encoding
- A vault file is identified with the `.kprv` which stands for **K**ey**PR** **V**ault.

## Overall Structure

Here's the overall structure of the vault file. Offsets are relative to the beginning of the file.

| Offset | Size (in bytes) | Field                                                        |
| ------ | --------------- | ------------------------------------------------------------ |
| 0      | 68              | Header                                                       |
| 68     | 32              | HMAC-SHA512-256 MAC of the header. Used to check if the header has been tampered with. Need the master password to check the integrity of the header. |
| 100    | 24              | XSalsa20 Nonce                                               |
| 124    | 16              | Poly1305 MAC authenticating the ciphertext                   |
| 140    | -               | Ciphertext: Encrypted JSON document                          |

## Header

The header is unencrypted and contains all the necessary informations to decrypt the vault such as the KDF parameters, the magic bytes identifying the file type, the format version, etc. Offsets are relative to the beginning of the header.

Here's the structure of the header:

| Offset | Size (in bytes) | Field |
| --------------- | --------------- | --------------- |
| 0 | 8 | Magic bytes to identify file type: "KVLT2026" |
| 8 | 4 | Format version |
| 12 | 32 | Argon2 KDF salt |
| 44 | 8 | Argon 2 Operations limit |
| 52 | 8 | Argon 2 Memory limit in bytes |

## Vault JSON document structure

### General structure

The JSON containing the entries has the following structure:

```json
{
  "vault": {
    "id": "01J...",
    "name": "Personal vault",
    "createdAt": "2026-08-20T14:02:00Z",
    "updatedAt": "2026-08-20T14:02:00Z"
  },
  "categories": [
    {
      "id": "cat-websites",
      "name": "Website",
      "builtin": true
    },
    {
      "id": "cat-wifi",
      "name": "Wi-Fi",
      "builtin": true
    },
    {
      "id": "cat-credit-cards",
      "name": "Credit card",
      "builtin": true
    }
  ],
  "entries": [],
  "personas": []
}
```

### Entry structure

The different entry types have the following structures

#### Website credential

```json
{
  "id": "01JWEBSITE...",
  "type": "website",
  "title": "Example",
  "categoryId": "cat-websites",
  "notes": "",
  "comments": "",
  "createdAt": "2026-08-20T14:02:00Z",
  "updatedAt": "2026-08-20T14:02:00Z",
  "data": {
    "username": "alice@example.com",
    "password": "correct horse battery staple",
    "url": "https://example.com",
    "personaId": "01JPERSONA...",
    "alias": {}
  }
}
```

#### Wifi Credentials

```json
{
  "id": "01JWIFI...",
  "type": "wifi",
  "title": "Home Wi-Fi",
  "categoryId": "cat-wifi",
  "notes": "Router located in the office",
  "comments": "",
  "createdAt": "2026-08-20T14:02:00Z",
  "updatedAt": "2026-08-20T14:02:00Z",
  "data": {
    "networkName": "MyNetwork",
    "password": "wifi-password"
  }
}
```

#### Credit card information

```json
{
  "id": "01JCARD...",
  "type": "credit_card",
  "title": "Personal Visa",
  "categoryId": "cat-credit-cards",
  "notes": "",
  "comments": "",
  "createdAt": "2026-08-20T14:02:00Z",
  "updatedAt": "2026-08-20T14:02:00Z",
  "data": {
    "cardholderName": "Alice Example",
    "cardNumber": "4111111111111111",
    "expirationMonth": 12,
    "expirationYear": 2030,
    "securityCode": "123",
    "pin": "4567"
  }
}
```

---

### Personas and aliases structure

#### Persona

Personas are stored at the DB level and are referenced by entries. They have the following structure:

```json
{
  "id": "01JPERSONA...",
  "name": "Alice Example",
  "createdAt": "2026-08-20T14:02:00Z",
  "updatedAt": "2026-08-20T14:02:00Z",
  "data": {
    "firstName": "Alice",
    "lastName": "Example",
    "dateOfBirth": "1992-04-17",
    "address": {
      "street": "123 Example Street",
      "postalCode": "1000",
      "city": "Lausanne",
      "state": "Vaud",
      "country": "CH"
    },
    "phone": "+41784563212"
  }
}
```

#### Alias

Aliases are stored within individual entries, they have the following structure:

```json
{
  "id": "01JALIAS...",
  "address": "shop-abc@example-alias.com",
  "status": "active",
  "entryId": "01JWEBSITE...",
  "createdAt": "2026-08-20T14:02:00Z",
  "updatedAt": "2026-08-20T14:02:00Z",
  "disabledAt": null,
  "provider": {
    "name": "ExampleAliasService",
    "remoteId": "alias-provider-id"
  }
}
```
