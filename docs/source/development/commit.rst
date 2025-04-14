Commit message guidelines
=========================

This document outlines the commit message convention to be followed for this Python project, which adheres to the Semantic Versioning 2.0.0 specification (SemVer). Consistent commit messages help in understanding the changes introduced in each commit, automating the release process, and generating clear changelogs.

Commit Message Structure
------------------------

Each commit message should consist of a **type**, a **scope** (optional), and a **short description**.

``<type>(<scope>): <short description>``

* **\<type>**: Indicates the nature of the change. Allowed types are:
    * **feat**: A new feature.
    * **fix**: A bug fix.
    * **docs**: Documentation only changes.
    * **style**: Changes that do not affect the meaning of the code (white-space, formatting, missing semicolons, etc.).
    * **refactor**: A code change that neither fixes a bug nor adds a feature.
    * **perf**: A code change that improves performance.
    * **test**: Adding missing or correcting existing tests.
    * **build**: Changes that affect the build system or external dependencies (example scopes: gulp, npm).
    * **ci**: Changes to our CI configuration files and scripts (example scopes: Travis, Circle, BrowserStack, SauceLabs).
    * **chore**: Other changes that don't modify src or test files.
    * **revert**: Reverts a previous commit.

* **\<scope>** (optional): Provides additional contextual information about the commit. It can be a specific module, component, or area of the codebase affected by the change. Use lowercase and keep it concise. Examples: `auth`, `user`, `api`, `database`.

* **\<short description>**: A concise summary of the change in the imperative, present tense. Use lowercase for the first word and do not end with a period. Examples: `add user authentication`, `fix login button alignment`, `update README with installation instructions`.

**Examples**

Here are some examples of well-formed commit messages:

* `feat(auth): implement user registration functionality`
* `fix: prevent crash when handling invalid input`
* `docs: update installation instructions in README`
* `style(formatting): apply PEP 8 code formatting`
* `refactor(database): improve query performance`
* `test: add unit tests for user model`
* `build(deps): upgrade requests library to latest version`
* `ci(travis): configure continuous integration pipeline`
* `chore: update project dependencies`
* `revert: fix(auth): implement user registration functionality`

Commit Message Body (Optional)
------------------------------

For more complex changes, you can add a more detailed explanation after the short description. Separate the short description from the body with a blank line. The body should provide context and reasoning for the changes.

.. code:: text

   feat(billing): add support for monthly subscriptions``

   This commit introduces a new billing feature that allows users to subscribe
   to monthly plans. It includes changes to the user model, payment processing
   logic, and API endpoints.

..

Commit Message Footer (Optional)
--------------------------------

The footer can be used to provide additional information, such as breaking changes or references to issues.

* **Breaking Changes**: If the commit introduces a breaking change, it should be indicated in the footer with the `BREAKING CHANGE:` prefix, followed by a description of the change and migration instructions if necessary.

.. code:: text

    feat(api): remove deprecated /users endpoint

    BREAKING CHANGE: The /users endpoint has been removed. Use the new /customers endpoint instead.
    See documentation for migration instructions.

..

* **Issue Tracking**: You can reference issues using keywords like `Closes`, `Fixes`, `Resolves`, or `Refs`, followed by the issue number.

.. code:: text

    fix(security): address potential XSS vulnerability

    Closes #123

..

Summary
-------

By following these commit message guidelines, we can maintain a clear and consistent project history, which is crucial for understanding changes, automating releases based on SemVer, and generating informative changelogs. Please ensure all your commits adhere to this standard.
