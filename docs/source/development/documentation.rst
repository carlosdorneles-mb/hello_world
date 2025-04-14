Documenting the code
====================

All functions and classes in the code follow `Google's <https://sphinxcontrib-napoleon.readthedocs.io/en/latest/example_google.html>`_
docstring standard.

To map a class, function or python code file in the documentation, simply create the file with type RST in the
`docs/source` folder. After that, map the file in the index of the module to which it belongs. The content of the
created documentation file must follow the `Sphinx autodoc <https://www.sphinx-doc.org/en/master/usage/extensions/autodoc.html>`_
extension standard.

To run the doc locally, simply run the ``make doc`` command.

See examples below:

- Mapping a function:

.. code:: rst

    Sentry
    ======

    .. autofunction:: shared.sentry.setup_sentry()

..

- Mapping a class:

.. code:: rst

    Environments Enum
    =================

    .. autoclass:: shared.enums.environment.EnvironmentEnum
        :members:
        :undoc-members:
        :show-inheritance:

..

- Mapping an exception:

.. code:: rst

    Exceptions
    ==========

    .. autoexception:: shared.exceptions::BaseError
        :members:
        :exclude-members: unpickle
        :show-inheritance:

..

Plugins
~~~~~~~

There are some plugins that you can use to improve your documentation, such as:

- `sphinx.ext.graphviz <https://www.sphinx-doc.org/en/master/usage/extensions/graphviz.html>`_: To create diagrams.
- `sphinx.ext.inheritance_diagram <https://www.sphinx-doc.org/en/master/usage/extensions/inheritance.html>`_: To create inheritance diagrams.
- `sphinxcontrib-mermaid <https://sphinxcontrib-mermaid-demo.readthedocs.io/en/latest/>`_: To create flow diagrams.
