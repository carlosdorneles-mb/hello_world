.. _badges:

.. image:: https://img.shields.io/badge/hello_world-0.0.0-orange
    :target: https://github.com/carlosdorneles-mb/hello_world
    :alt: hello_world

.. image:: https://img.shields.io/badge/Python->=3.12,<3.14-blue
    :target: https://github.com/carlosdorneles-mb/hello_world
    :alt: Python Version

.. image:: https://github.com/carlosdorneles-mb/hello_world/actions/workflows/ci.yml/badge.svg
    :target: https://github.com/carlosdorneles-mb/hello_world/actions/workflows/ci.yml
    :alt: Lint, Tests, Sonar and Sec

----

Creating your project
---------------------

After cloning this repository, rename the ``hello_world`` folder to the name of your project.

Then, replace the entire project by replacing ``hello_world`` with the name of your project,
for example ``my_project``. Also search for ``carlosdorneles-mb`` and replace it with ``mercadobitcoin``.

In ``.github/workflows/notifier.yml`` you should change line 18, adding the data of the space that will receive the notification when a PR is opened.

-----

.. _start_title

hello_world
-----------

Describe why the project was created, what it does, and how it can be useful.

.. _end_title

.. image:: docs/source/_static/read.png
    :target: https://carlosdorneles-mb.github.io/hello_world
    :width: 300
    :alt: Read The Docs

- `Project documentation <https://carlosdorneles-mb.github.io/hello_world>`_
- `Project coverage <https://carlosdorneles-mb.github.io/hello_world/_static/coverage/index.html>`_

-----

.. _start_installation

Installation
~~~~~~~~~~~~

Package is available on the Mercado Bitcoin internal Pypi.
To install the package in a Python project, use some package manager, see some examples below.

Pip
###

If your project uses Pip for package management, add the code below in your *requirements.txt*
and then run ``pip install -r requirements.txt`` to install the dependencies.

.. code:: text

    --extra-index-url https://pypi.dev.mercadolitecoin.com.br/simple

    hello_world

..

Poetry
######

If your project uses `Poetry <https://python-poetry.org/>`_ for package management, run the commands below:

.. code:: bash

    poetry source add --priority=supplemental internal https://pypi.dev.mercadolitecoin.com.br/simple
    poetry add hello_world

..

UV
##

If your project uses `UV (Astral) <https://docs.astral.sh/uv/>`_ for package management, run the commands below:

.. code:: bash

    uv add hello_world --index mb=https://pypi.dev.mercadolitecoin.com.br/simple

..

.. _end_installation

-----

.. _start_contributing

Contributing
~~~~~~~~~~~~

Do you want to contribute to the project? Follow the steps below to set up the development environment.

1. Install `UV <https://docs.astral.sh/uv/getting-started/installation/>`_
2. Clone the repository
3. Run ``make init`` to configure the environment and install dependencies

Useful commands

- ``make install``: Install project dependencies
- ``make upgrade``: Upgrade project dependencies that are not pinned
- ``make lint-fix``: Run the project lint to fix possible errors
- ``make doc``: Generate documentation and run server
- ``make test``: Run the application unit tests

.. _end_contributing
