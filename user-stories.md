# User Stories

## Vault Management

### Create a vault

**As a** user,  
**I want** to create a new vault with a master password,  
**so that** I can securely store my sensitive information.

**Acceptance criteria:**

- The user can enter a vault name.
- The user must define a master password.
- The application requests confirmation of the master password.
- A unique salt is generated for the vault.
- The vault is created as an encrypted file.
- The master password is never stored.
- The user receives a confirmation when the vault is created.

---

### Open a vault

**As a** user,  
**I want** to open an existing vault,  
**so that** I can access my stored entries.

**Acceptance criteria:**

- The user can select an encrypted vault file.
- The user must enter the corresponding master password.
- The vault is opened only if the password is correct.
- An incorrect password displays a clear error message.
- The vault remains locked if decryption fails.

---

### Support multiple vaults

**As a** user,  
**I want** to manage multiple vaults,  
**so that** I can separate my personal, professional, and other credentials.

**Acceptance criteria:**

- The user can create several vaults.
- Each vault can have a different master password.
- The user can open, close, and switch between vaults.
- Only the currently unlocked vault is accessible.
- The application clearly displays the active vault.

---

### Lock a vault manually

**As a** user,  
**I want** to lock my vault with one click,  
**so that** my data is protected when I leave my device.

**Acceptance criteria:**

- A visible lock button is available.
- Clicking the button immediately locks the vault.
- The browser extension can no longer access the vault.
- The user must re-enter the master password to unlock it.
- Unsaved changes trigger a confirmation message.
- The vault session is destroyed after closing.
- The user is returned to the vault selection screen.

---

### Automatically lock a vault

**As a** user,  
**I want** my vault to lock automatically after inactivity,  
**so that** it remains protected if I forget to lock it.

**Acceptance criteria:**

- The vault automatically locks after five minutes of inactivity.
- The timer resets when the user interacts with the application.
- The browser extension can no longer request entries after locking.
- The user must unlock the vault again to access it.

---

### Detect a corrupted vault

**As a** user,  
**I want** to be informed when a vault is corrupted or invalid,  
**so that** I know how to proceed.

**Acceptance criteria:**

- The application detects invalid vault files.
- The vault is not opened if integrity verification fails.
- The error message does not expose sensitive information.
- The user is advised to use a backup if available.

---

## Credential Entries

### Add a website credential

**As a** user,  
**I want** to store website credentials,  
**so that** I do not have to remember them.

**Acceptance criteria:**

- The user can enter a service name.
- The user can enter a username or email address.
- The user can enter a password.
- The user can enter one or more URLs.
- The user can add optional notes.
- The entry is saved only after user confirmation.

---

### Modify an entry

**As a** user,  
**I want** to modify an existing entry,  
**so that** I can keep my information up to date.

**Acceptance criteria:**

- The user can edit all editable fields.
- Changes are validated before saving.
- Changes are encrypted before being written to disk.
- The updated entry is displayed after saving.

---

### Delete an entry

**As a** user,  
**I want** to delete an entry,  
**so that** I can remove information I no longer need.

**Acceptance criteria:**

- The user can select an entry and delete it.
- The application asks for confirmation.
- The entry is removed after confirmation.
- The deletion is saved to the encrypted vault.

---

### View an entry

**As a** user,  
**I want** to view the details of an entry,  
**so that** I can use the stored information.

**Acceptance criteria:**

- The user can open an entry.
- Sensitive fields are hidden by default.
- The user can reveal sensitive fields.
- The sensitive fields are automatically hidden after a timeout.
- The user can copy sensitive fields to the clipboard.
- The sensitive fields are cleared from the clipboard after a timeout.
- The application clearly identifies the entry type.
- The entry is accessible only while the vault is unlocked.

---

### Search for an entry

**As a** user,  
**I want** to search my vault,  
**so that** I can quickly find an entry in the selected category.

**Acceptance criteria:**

- The search results match the entry name, username, or URL.
- Search results update quickly.
- Search results do not display passwords by default.

---

### Categorize entries

**As a** user,  
**I want** to assign categories to entries,  
**so that** I can organize my vault.

**Acceptance criteria:**

- The user can select a category when creating an entry.
- The user can filter entries by category.
- The application supports categories such as website, Wi-Fi, and credit card.

---

### Add custom notes

**As a** user,  
**I want** to add notes to an entry,  
**so that** I can store additional related information.

**Acceptance criteria:**

- The user can add optional notes.
- Notes are encrypted with the rest of the entry.
- Notes are hidden when the entry is not open.
- Notes can be edited and deleted.

---

## Wi-Fi Credentials

### Store Wi-Fi credentials

**As a** user,  
**I want** to store Wi-Fi credentials,  
**so that** I can securely remember network information.

**Acceptance criteria:**

- The user can enter the network name.
- The user can enter the password.
- The user can add optional notes.
- The information is encrypted in the vault.

---

## Credit Card Information

### Store credit card information

**As a** user,  
**I want** to store credit card information,  
**so that** I can access it securely when needed.

**Acceptance criteria:**

- The user can store the cardholder name.
- The user can store the card number.
- The user can store the expiration date.
- The user can store the security code.
- Sensitive values are hidden by default.
- The information is encrypted in the vault.

---

## Password Generator

### Generate a random password

**As a** user,  
**I want** to generate a secure random password,  
**so that** I can create strong credentials.

**Acceptance criteria:**

- The user can choose the password length.
- The password must contain uppercase letters, lowercase letters and numbers.
- The user can choose to include special characters or not.
- The generated password uses a secure random generator.
- The password is uniformly random according to the selected character set.
- The generated password replaces the current password in the entry form.

---

## Personas

### Create a persona

**As a** user,  
**I want** to create a fictional persona,  
**so that** I can avoid sharing my real personal information.

**Acceptance criteria:**

- The user can create a persona with a fictional name.
- The user can add a date of birth.
- The user can add an address.
- Persona data is stored encrypted.

---

### Generate a random persona

**As a** user,  
**I want** to generate a random fictional persona,  
**so that** I can avoid sharing my real personal information.

**Acceptance criteria:**

- The user can request a randomly generated persona.
- The generated persona includes a name, date of birth, and address.
- The generated persona is plausible and realistic.
- Persona data is stored encrypted.

---

### Modify a persona

**As a** user,  
**I want** to modify a persona,  
**so that** I can keep its information up to date.

**Acceptance criteria:**

- The user can edit persona fields.
- Changes are validated.
- Changes are encrypted before being saved.
- Existing associations with entries remain valid.

---

### Delete a persona

**As a** user,  
**I want** to delete a persona,  
**so that** I can remove information I no longer use.

**Acceptance criteria:**

- The application asks for confirmation.
- The user is warned if the persona is associated with entries.
- The persona is deleted after confirmation.
- Existing associated entries are no longer associated with the deleted persona.

---

### Associate a persona with an entry

**As a** user,  
**I want** to associate a persona with an entry,  
**so that** I know which identity was used for that service.

**Acceptance criteria:**

- The user can select an existing persona.
- The association is visible in the entry.
- The user can remove or change the association.
- The associated persona remains encrypted.

---

### Fill a registration form with a persona

**As a** user,  
**I want** the browser extension to fill registration forms with a persona,  
**so that** I can register without sharing my real information.

**Acceptance criteria:**

- The extension detects supported registration forms.
- The user can select a persona.
- The extension fills only the requested fields.
- The user must confirm before filling the form.
- The extension does not transmit the entire vault.

---

## Email Aliases

### Create an email alias

**As a** user,  
**I want** to create an email alias,  
**so that** I can hide my real email address.

**Acceptance criteria:**

- The user can request an alias.
- The alias is unique.
- The alias is associated with the selected entry.
- The alias is stored in the vault.
- The real email address is not exposed to third parties.

---

### Forward emails received by an alias

**As a** user,  
**I want** emails sent to my alias to be forwarded to my real inbox,  
**so that** I can receive messages without sharing my real address.

**Acceptance criteria:**

- Emails sent to the alias are forwarded to the configured inbox.
- The sender does not see the real email address.
- Invalid aliases are rejected.
- Forwarding failures are handled appropriately.

---

### Disable an email alias

**As a** user,  
**I want** to disable an email alias,  
**so that** I can stop receiving emails from an unwanted service.

**Acceptance criteria:**

- The user can disable an alias.
- The application asks for confirmation.
- New emails sent to the alias are no longer forwarded.
- The alias status is visible to the user.

---

## Browser Extension

### Install the browser extension

**As a** user,  
**I want** to install the browser extension,  
**so that** I can use my vault in my browser.

**Acceptance criteria:**

- Installation instructions are available.
- The extension is compatible with chromium-based browsers.
- The extension can communicate with the desktop application.
- The extension displays an error if the desktop application is unavailable.

---

### Autofill website credentials

**As a** user,  
**I want** to autofill my website credentials,  
**so that** I can log in quickly.

**Acceptance criteria:**

- The extension detects supported username and password fields.
- It identifies the current website URL.
- The user can select a matching credential.
- The username and password are filled into the correct fields.
- The vault must be unlocked.
- The extension receives only the selected entry.
- Autofill requires user interaction.

---

### Ask for an unlock

**As a** user,  
**I want** the extension to notify me when the vault is locked,  
**so that** I know why autofill is unavailable.

**Acceptance criteria:**

- The extension detects that the vault is locked.
- It asks the user to unlock the vault.
- The master password is never sent to the extension.
- The user must return to the desktop application to unlock the vault.

---

## Secure Communication

### Authenticate extension communication

**As a** user,  
**I want** communication between the desktop application and extension to be authenticated,  
**so that** unauthorized applications cannot request my credentials.

**Acceptance criteria:**

- The desktop application only accepts authorized native messaging requests.
- Invalid requests are rejected.
- Requests contain enough information to identify the target website.
- Sensitive data is sent only after successful authorization.
- The entire vault is never transmitted.

---

### Request a specific credential

**As a** browser extension,  
**I want** to request one matching credential from the desktop application,  
**so that** I can autofill the current website securely.

**Acceptance criteria:**

- The request contains the current website context.
- The desktop application returns only matching entries.
- The response contains no unrelated vault data.
- The request fails if the vault is locked.

---

## Vault Encryption and Storage

### Encrypt vault data

**As a** user,  
**I want** all vault data to be encrypted,  
**so that** stolen vault files cannot be read.

**Acceptance criteria:**

- Plaintext entries are never written to disk.
- A recognized authenticated encryption algorithm is used.
- The encryption key is derived from the master password.
- Each vault has a unique salt.
- Authentication failures are detected.

---

### Derive a cryptographic key

**As a** security engineer,  
**I want** the vault key to be derived securely from the master password,  
**so that** brute-force attacks are more difficult.

**Acceptance criteria:**

- A suitable password-based key derivation function is used.
- A unique salt is generated for every vault.
- KDF parameters are stored as non-secret metadata.
- The master password is not stored.

---

### Detect vault tampering

**As a** user,  
**I want** the application to detect modifications to the vault file,  
**so that** I know whether my data has been altered.

**Acceptance criteria:**

- The vault uses authenticated encryption or an equivalent integrity mechanism.
- Modified ciphertext is rejected.
- The application displays a clear error.
- No corrupted data is loaded into the session.

---

## Reliability

### Save changes atomically

**As a** user,  
**I want** vault changes to be saved atomically,  
**so that** a crash does not leave the vault partially written.

**Acceptance criteria:**

- Changes are written to a temporary file first.
- The temporary file is validated.
- The original file is replaced only after successful writing.
- Failed writes do not destroy the previous valid vault.

---

### Recover after an application crash

**As a** user,  
**I want** to recover my last valid vault after an application crash,  
**so that** my data is not lost.

**Acceptance criteria:**

- A crash does not corrupt the existing vault.
- The application can reopen the last valid version.
- Temporary files are handled safely.

---

### Protect sensitive session data

**As a** user,  
**I want** sensitive data to be removed from memory when the vault is locked,  
**so that** it cannot remain accessible after locking.

**Acceptance criteria:**

- The active vault session is destroyed when possible.
- Sensitive temporary values are cleared.
- The extension can no longer request credentials.
- The application does not keep unnecessary plaintext copies.

---

## Cross-Platform Application

### Use the application on Linux, macOS, and Windows

**As a** Linux user, macOS user, or Windows user, 
**I want** to install and use the application on my operating system,  
**so that** I can manage my vault on my operating system.

**Acceptance criteria:**

- The core functionality works on the supported operating systems.
- The interface behaves consistently.
- The vault format is compatible between platforms.
- Installation instructions are provided.
- Platform-specific errors are handled clearly.

---

## User Experience

### Use keyboard shortcuts

**As a** user,  
**I want** keyboard shortcuts for frequent actions,  
**so that** I can use the application efficiently.

**Acceptance criteria:**

- The user can save changes with a keyboard shortcut.
- The user can copy a password with a keyboard shortcut.
- The user can lock the vault with a keyboard shortcut.
- Shortcuts are documented in the documentation.

---

## Performance

### Decrypt the vault quickly

**As a** user,  
**I want** my vault to be decrypted in less than one second under normal conditions,  
**so that** the application remains pleasant to use.

**Acceptance criteria:**

- A representative vault decrypts in less than one second on supported hardware.
- Performance tests are automated or documented.
- The application displays progress feedback if decryption takes longer.

---

### Keep the GUI reactive

**As** a user,  
**I want** the interface to remain responsive,  
**so that** I can interact with the application without freezing.

**Acceptance criteria:**

- Long-running operations do not block the GUI.
- The interface provides feedback during operations.
- The application remains usable while performing background tasks.

---

## Email Alias Infrastructure

### Request an alias from the server

**As** a user,  
**I want** the desktop application to request an email alias from the alias service,  
**so that** I can create an alias for an email address.

**Acceptance criteria:**

- The desktop application sends an authenticated request.
- The server creates or returns a unique alias.
- The alias is associated with the email address.
- Network errors are handled safely.
- The alias is saved in the encrypted vault.

---

### Configure the API key for the alias service

**As** a user,  
**I want** to configure the API key for the alias service,  
**so that** the desktop application can request aliases to the service.

**Acceptance criteria:**

- The desktop application can remember the API key.
- The desktop application can use the configured API key to request aliases.
- The user can update the API key at any time.

---

### Documentation for the alias service

**As** a user,
**I want** to have documentation for the alias service,
**so that** I can understand how to use it and what to expect.

**Acceptance criteria:**

- The documentation explains how to get the API key from the alias service.
- The documentation explains how to configure the DNS of my domain.
- The documentation explains how to configure the API key.
- The documentation explains how to request an alias.
- The documentation explains how to disable an alias.

---

## Development and Quality

### Run automated tests

**As** a developer,  
**I want** automated tests to run for every code change,  
**so that** regressions are detected early.

**Acceptance criteria:**

- Unit tests run on every Pull Request.
- Integration tests run for the core and client.
- Failed tests prevent merging.
- Test results are visible to the team.

---

### Build all project components

**As** a developer,  
**I want** the client, core library, extension, and landing page to be built automatically,  
**so that** every repository remains deliverable.

**Acceptance criteria:**

- Each repository has its own CI pipeline.
- The core library builds successfully.
- The desktop application builds successfully.
- The browser extension builds successfully.
- The landing page builds successfully.

---

### Publish a desktop application release

**As** a developer,  
**I want** to generate release artifacts automatically,  
**so that** users can install a validated version of the application.

**Acceptance criteria:**

- Releases are triggered by version tags.
- Builds are generated for supported platforms.
- The browser extension package is generated.
- Checksums are published.
- Release notes are included.
