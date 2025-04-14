Versioning flow
===============

The described versioning flow follows the SemVer (Semantic Versioning) standard and is structured around five main
commands: ``major``, ``minor``, ``patch``, ``pre_release``, and ``pre_release_version``. Below, we detail how each
command affects the version and the rules governing the transition between different version states.

Version Formats
---------------

- **Major**: Generates a version in the format ``X.0.0``.
- **Minor**: Generates a version in the format ``0.X.0``.
- **Patch**: Generates a version in the format ``0.0.X``.
- **Pre-release**: Generates a version in the format ``0.0.0-rcX``.
  - If already in an ``rc`` version, the command cannot be executed again, resulting in an error.
  - To increase the ``rc`` version number, the ``pre_release_version`` command must be used.
- **Pre-release Version**: Generates a version following these rules:
  - If in a ``major``, ``minor``, or ``patch`` version, it generates a development version in the format ``0.0.0-devX``.
  - If already in a development version, it only increases the version number: ``0.0.0-dev0`` becomes ``0.0.0-dev1``, and so on.
  - If already in an ``rc`` version, it only increases the version number: ``0.0.0-rc0`` becomes ``0.0.0-rc1``, and so on.

Version Transitions
-------------------

To close a version, simply run one of the commands ``major``, ``minor``, or ``patch``. Examples of transitions:

- From ``0.0.0-devX`` to ``0.0.X`` (closing a development version and generate patch version).
- From ``0.0.0-rcX`` to ``0.0.X`` (closing a release candidate version and generate patch version).

Versioning Rules
----------------

The versioning rules define how versions can be changed:

1. **dev → rc → major/minor/patch**: A development version (``dev``) can be promoted to an ``rc`` version, which in turn can be promoted to a ``major``, ``minor``, or ``patch`` version.
2. **rc → major/minor/patch**: An ``rc`` version can be directly promoted to a ``major``, ``minor``, or ``patch`` version.
3. **major → dev/rc/minor/patch**: A ``major`` version can be reverted to a development version (``dev``), or promoted to an ``rc`` version, or incremented to a ``minor`` or ``patch`` version.
4. **minor → dev/rc/major/patch**: A ``minor`` version can be reverted to a development version (``dev``), or promoted to an ``rc`` version, or incremented to a ``major`` or ``patch`` version.
5. **patch → dev/rc/major/minor**: A ``patch`` version can be reverted to a development version (``dev``), or promoted to an ``rc`` version, or incremented to a ``major`` or ``minor`` version.

If necessary, use the ``release-show`` command to see the detailed flow according to the current version.

Summary
-------

This versioning flow provides a clear and structured system for managing software versions, allowing developers to make changes and improvements in a controlled manner. The transitions between different version states are well-defined, ensuring that the software evolves in a predictable and understandable way.
