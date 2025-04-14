Project Dependencies and Their Roles
------------------------------------

This document outlines the key development dependencies used in this Python project and explains their respective roles. Understanding these tools will help new contributors get up to speed with our development workflow.

**Core Development Tools**

* **uv (astral)**:
    * **Role**: Package manager and resolver. ``uv`` is used for managing the project's dependencies, similar to ``pip`` but with a focus on speed and efficiency. It ensures that all necessary libraries are installed and their versions are consistent across the development environment. You'll use UV to install, update, and manage the project's requirements defined in files like `requirements.txt` or `pyproject.toml`.

* **ruff**:
    * **Role**: Linter and code formatter. ``ruff`` is employed to automatically check the codebase for stylistic and potential programmatic errors (linting). It also formats the code to adhere to a consistent style, ensuring readability and maintainability. Ruff helps catch issues early in the development process and enforces code style conventions.

* **pyright**:
    * **Role**: Static type checker. ``pyright`` performs static analysis on the Python code to verify type hints. By using type hints and Pyright, we aim to improve code reliability, understandability, and prevent type-related errors at runtime. It helps ensure that the code adheres to the intended types of variables and function arguments.

* **pytest**:
    * **Role**: Test runner and framework. ``pytest`` is used to write and execute unit tests for the project. Unit tests are crucial for verifying the correctness of individual components of the codebase. pytest provides a simple and powerful way to create and run tests, ensuring that changes don't introduce regressions.

* **sphinx**:
    * **Role**: Documentation generator. ``sphinx`` is used to create the project's documentation. The ``autodoc`` extension automatically extracts documentation from the Python docstrings within the code. This ensures that the documentation is always up-to-date with the codebase and provides a clear guide for users and contributors.

* **bump-my-version**:
    * **Role**: Version management tool. ``bump-my-version`` helps automate the process of updating the project's version number according to the Semantic Versioning 2.0.0 specification (SemVer). Based on the types of commits made (as per our commit message guidelines), this tool can automatically increment the major, minor, or patch version.

* **git-cliff**:
    * **Role**: Changelog generator. ``git-cliff`` is used to automatically generate the project's changelog file based on the commit history. It parses the commit messages (following the SemVer-based commit message convention) to create a well-formatted and informative changelog that details the changes introduced in each release.

* **pre-commit**:
    * **Role**: Git hook manager. ``pre-commit`` is a framework for managing and executing pre-commit hooks. These hooks are scripts that run automatically before a commit is finalized. We use pre-commit to enforce code style checks (via Ruff), type checking (via Pyright), and other quality checks, ensuring that only clean and compliant code is committed to the repository.

**How These Dependencies Work Together**

These tools are integrated into our development workflow to ensure a high standard of code quality, maintainability, and a smooth release process:

1.  **Development**: When you write code, you'll use ``UV`` to manage the necessary libraries.
2.  **Code Quality**: Before committing your changes, ``pre-commit`` will automatically run Ruff (for linting and formatting) and Pyright (for type checking). If any issues are found, you'll need to address them before the commit is accepted.
3.  **Testing**: pytest is used to write and run unit tests to verify your changes. These tests should pass before you commit.
4.  **Documentation**: Ensure your code includes clear docstrings, as Sphinx with ``autodoc`` will use these to generate the project's documentation.
5.  **Versioning and Changelog**: When it's time for a release, ``bump-my-version`` will update the project's version based on the commit history. ``git-cliff`` will then generate the changelog by parsing the commit messages, which should follow the SemVer convention.

By understanding and utilizing these dependencies effectively, you will contribute to a robust and well-maintained project.
