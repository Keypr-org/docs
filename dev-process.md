# Development process

## Team members

- Alberto De Sousa Lopes
- Maikol Correia Da Silva
- Pierre Thiébaud
- Nolan Evard

## Methodology

We will use the Scrum methodology for our development process. The sprints will be 1 week long, at the beginning of the week will take place the sprint planning where we chose the user stories to implement during the sprint. We also define the tasks composing each users stories of the sprint backlog and estimate the corresponding effort.

At the end of the week we will have a sprint review where we will present the work done during the sprint and a retrospective where we will discuss with the team what went well and what can be improved for the next sprint.

## Team organization

Each member will have the following role:

| Member  | Role / Field of action |
| ------- | ---------------------- |
| Maikol  |                        |
| Nolan   |                        |
| Alberto |                        |
| Pierre  |                        |

## Project structure

The project is separated into several parts and each of these parts has its own repository into the GitHub organization we created for this project:

- **Documentation repository**: contains all the documentation related to the project, including this development process document.
- **Landing page repository**: contains the code for the landing page of the project and the CI/CD pipeline to deploy it.
- **Qt Client**: contains the code of the desktop application and the CI/CD pipeline to build it.
- **Core**: contains the code of the core library that is responsible of handling encryption/decryption/parsing of the vault files and the CI/CD pipeline to build it.
- **Browser Extension**: contains the code of the browser extension.

The **Qt Client** repository will contain the **core** repository as a _git submodule_ as it needs the core library for most of its operations.

## Tasks management

Each task is related to one or more user story and has a defined priority and estimated effort.

The possible priority labels are:

- **Critical**, must be done in the current sprint.
- **Important**, should be done in the current sprint.
- **Nice to have**, can be done in the current sprint if we have enough time.

The tasks are managed using GitHub issues and are tracked in the [project KanBan](https://github.com/orgs/PDG-2026/projects/1) of the GitHub organization. There can only be one task per member in progress and in review meaning we must finish and review a task before starting a new one. This prevents team members from loosing focus by working on multiple things at once.

## Git workflow

The workflow to work on a task is the following:

1. Assign the task to a member
2. Create a dedicated branch on the corresponding repository
3. Write the tests for the expected behavior
4. Implement the task so all the test cases pass
5. Create a pull request
6. Review the code (others review it)
7. Update code / tests based on others feedback
8. Merge the task to the _develop_ branch

The git branches will be organised as follows:

- _main_ branch is reserved for the production version of the project and is protected, meaning that no one can push directly to it.
- _develop_ branch is the main development branch where all the tasks are merged after being reviewed and validated. It is also protected.
- _feature/\<task-name\>_ branches are created for each task and are deleted after the task is merged into the _develop_ branch.

The commit message must follow the following convention:

```
[Type] <infinitive verb> <short description of the change>
```

Where `[Type]` can be one of the following:
- **[Feat]**: for new features
- **[Fix]**: for bug fixes
- **[Doc]**: for documentation changes
- **[Core]**: when updating the version of the core lib contained in another repository

And infinitive verb is the action performed by the commit, for example: add, remove, fix, update, refactor, etc.

All commits must be signed (verified) and every pull request must be accepted by at least 1 other member before it can be merged into _main_ or _develop_.

Each pull request should contain only additional informations that are required for the reviewer to understand what has been done. The code should be documented enough that no full explanation is required about the PR. PRs can also include links to external references if relevant.

## Review process

When reviewing a feature / task, you must at least:

- Check that all tests are passing and meaningful
- Check that the coding conventions are respected
- Check that the code is documented
- Read the changes ENTIRELY
- Provide a feedback to the author

## Validation and testing

Each task must be tested with unit tests, each user story (group of tasks) must be tested with integration tests and before each release end to end tests must be conducted.

Integration and end to end tests can be done manually but they must check all validation criterias of the user stories.
