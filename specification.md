# Project Specification

## Summary

Securely storing passwords has never been more important than today as many platforms require a long and difficult to guess password which are also hard for humans to remember. That's why a password manager is a must-have today. We decided to build our own password manager that aims at simplicity and uses known secure cryptographic algorithms.

## Objective

The main goal of this project is to build a secure and trusted password manager that we fully control focused on privacy. It is meant to be free and open source and a simple alternative to all the commercial solutions.

## Functional requirements

- The user can store entries that can be website credentials (username, password, url, ...), wifi credentials or credit card informations.
- The user must enter its _master password_ to decrypt a given vault (each vault can have its own master password to decrypt it).
- The user can have multiple vaults
- The vault can be stored locally on disk or on a remote server
- The user can synchronize its vaults using a commercial cloud storage solution (OneDrive, iCloud, ...) or our own synchronisation solution that ships with the project
- The user must provide valid credentials to connect to the remote server if using the synchronisation solution provided by the project.
- The user can add/modify/delete entries from a _vault_.
- The user can generate random and secure passwords using the integrated password generator.
- The user can store entries in categories.

## Non-functional requirements

### Security

- The entries are stored in a secure _vault_ which is a special file containing the encrypted entries.
- The password generator must generate uniformly random passwords
- The vault must store only encrypted data and follow the chosen file specification
- The vault data must be encrypted using a secure and well known cipher (E.g.: AES-256)
- The provided synchronisation solution must transfer password between devices securely using up to date secure protocols
- The vault locks itself after 5 minutes.

### Performance

- The decryption of the vault must take less than 1 second.
- The GUI must be reactive so the user experience is pleasant.

### Reliability

- Write operations to the vault must be atomic
- A crash of the app must not corrupt the _vault_.

### Compatibility

- The app must be cross-platform meaning it must work on Linux, MacOS and Microsoft Windows.
- The _vault_ must be accessible offline, if using a synchronisation solution the last accessed version must be accessible offline.

### Usability

- The user must be able to lock the vault in one click.
- The error messages must be clear and tell the user how to proceed correctly.
- The sensitive entries (password, card number, ...) must be hidden by default.
- The app must feature keyboard shortcuts for frequently used features such as saving the changes made to the vault or copying the password of an entry.
- Actions that delete an entry must ask for confirmation beforehand.
