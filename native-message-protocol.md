# Native Message protocol

This document explains what the chrome extension sends and what it requires in return from the `client-server` (the client app Keypr). We will be using chrome's API ([Native Messaging](https://developer.chrome.com/docs/extensions/develop/concepts/native-messaging)) to exchange `json` files.

## Message format

### Extension wants to know the entries available for a given URL

**Extension request:**

```json
{
    "type": "GET_ENTRIES",
    "url": "https://example.com"
}
```

**Client-server response:**

```json
{
    "type": "ENTRIES",
    "entries": [
        {
            "id": "1",
            "username": "Bob"
        },
        {
            "id": "2",
            "username": "Alice"
        }
    ]
}
```

### Extension wants to know the password for a given entry

**Extension request:**

```json
{
    "type": "GET_PASSWORD",
    "id": "1",
}
```

**Client-server response:**

```json
{
    "type": "PASSWORD",
    "password": "example_password"
}
```

### Qt client throws an ERROR

```json
{
    "type": "ERROR",
    "code": "<error_type>"
}
```

`<error_type>` can be an error telling that the vault is locked for example.
