#
# Entendendo o '=' e ':='
#	= (Atribuição de variável "atualizada"). Isso significa que se a variável for alterada depois de sua definição, a nova definição será usada quando a variável for chamada.
#	:= (Atribuição de variável "imediata"). Isso significa que o valor da variável é "congelado" e não mudará, mesmo que a variável referenciada seja alterada posteriormente.
#

.ONESHELL:
SHELL := /bin/sh
REQUIRED_PYTHON_VERSION := $(shell cat .python-version)
LAST_LOCAL_TAG = $(shell git tag | sort -V | tail -n 1)
LAST_REMOTE_TAG = $(shell git describe --tags --abbrev=0)
ROOT_DIR := $(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))
ENVIRONMENT_VARIABLES=$(shell grep -v '^\#' .env | xargs)
PROJECT := hello_world

BLACK='\033[0;30m'
LIGHT_BLACK='\033[1;30m'
RED='\033[0;31m'
LIGHT_RED='\033[1;31m'
GREEN='\033[0;32m'
LIGHT_GREEN='\033[1;32m'
YELLOW='\033[0;33m'
LIGHT_YELLOW='\033[1;33m'
BLUE='\033[0;34m'
LIGHT_BLUE='\033[1;34m'
PURPLE='\033[0;35m'
LIGHT_PURPLE='\033[1;35m'
CYAN='\033[0;36m'
LIGHT_CYAN='\033[1;36m'
GRAY='\033[0;37m'
LIGHT_GRAY='\033[1;37m'
NC='\033[0m'

help:
	@echo 'To see the available Django commands, run the following command "make manage".'
	@echo 'For more information read the project Readme.'
	@echo
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

init:  ## Set the initial settings for the project
	@uv lock
	@rm -rf .venv
	@echo ${LIGHT_GREEN}"updating the UV version..."${NC}
	@uv self update
	@echo ${LIGHT_GREEN}"creating virtual environment..."${NC}
	@uv venv --python ${REQUIRED_PYTHON_VERSION} --seed
	@$(MAKE) install
	@uv run pre-commit install
	@git config pull.rebase true
	@echo ${LIGHT_GREEN}"configuration initialization complete"${NC}

install i requirements: ## Install project dependencies
	@uv lock
	@echo ${LIGHT_GREEN}"installing dependencies..."${NC}
	@uv sync --all-packages --all-extras --all-groups --frozen
	@echo ${LIGHT_GREEN}"installed dependencies"${NC}
	@$(MAKE) show-tree only=latest

upgrade u:  ## Upgrade project dependencies that are not pinned
	@echo ${LIGHT_GREEN}"updating dependencies that are not pinned..."${NC}
	@uv sync --all-packages --all-extras --all-groups --upgrade
	@$(MAKE) show-tree only=latest
	@echo ${LIGHT_GREEN}"updated dependencies"${NC}

show-tree:  ## Show project dependencies. Run make show-tree or make show-tree only=latest
	@echo ${LIGHT_GREEN}"checking for outdated dependencies..."${NC}
	@if [ "$(only)" = "latest" ]; then \
		uv tree --outdated | grep --color=always latest; \
		echo ${GRAY}"To update dependencies, run the command:" ${LIGHT_GRAY}"make upgrade"${NC}; \
	else \
		uv tree --outdated; \
	fi

lint:  ## Run the lint project to identify possible errors
	@echo ${LIGHT_GREEN}"running lint..."${NC}
	@echo ${LIGHT_GRAY}"step 1: ruff"${NC}
	@uv run ruff check hello_world/
	@echo ${LIGHT_GRAY}"step 2: pyright"${NC}
	@uv run pyright --project $(ROOT_DIR)/pyproject.toml --level error

lint-fix:  ## Run the project lint to fix possible errors
	@echo ${LIGHT_GREEN}"running lint..."${NC}
	@echo ${LIGHT_GRAY}"step 1: ruff check"${NC}
	@uv run ruff check hello_world/ --fix --unsafe-fixes
	@uv run ruff check tests/ --isolated --select I --fix
	@uv run ruff check tests/ --isolated --select COM --ignore COM812 --fix
	@uv run ruff check tests/ --isolated --select ICN --fix
	@uv run ruff check tests/ --isolated --select Q --fix
	@uv run ruff check tests/ --isolated --select TID --fix
	@uv run ruff check tests/ --isolated --select RUF --ignore RUF012 --ignore RUF100 --ignore RUF010 --fix
	@uv run ruff check tests/ --isolated --select T20 --fix
	@echo ${LIGHT_GRAY}"step 2: ruff format"${NC}
	@uv run ruff format hello_world/
	@echo ${LIGHT_GRAY}"step 3: pyright"${NC}
	@uv run pyright --project $(ROOT_DIR)/pyproject.toml --level error

shell:  ## Run the project shell
	@echo ${LIGHT_GREEN}"running shell..."${NC}
	@uv run ipython --ipython-dir=./

run-doc doc:  ## Run documentation. Example: make doc ou make doc clear=true
	@if [ "$(clear)" = "true" ]; then \
		echo "Cleaning documentation..."; \
		rm -rf docs/build; \
	fi
	@uv run sphinx-autobuild ./docs/source/ docs/build/html/ -v

test:  ## Run the application unit tests
	@uv run pytest -x --full-trace -n auto --durations=50 --durations-min=10 --timeout=20

test-cov:  ## Run tests with coverage
	@uv run pytest -n auto --timeout=20 --cov=$(PROJECT)/ --rsyncdir=$(PROJECT) --rsyncdir=tests

test-cov-report: test-cov  ## Run tests with coverage and generate the report
	@uv run coverage xml
	@uv run coverage report

test-cov-server: test-cov  ## Run tests with coverage and open the server to see coverage details
	@uv run coverage html
	@python -m http.server 8001 --bind 0.0.0.0 --directory htmlcov

test-matching:  ## Run the match tests. Ex.: make test-matching q='MyTestClass or my_test_function'
	@echo "Running tests that match the pattern" ${LIGHT_GREEN}"$(q)"${NC}
	@echo "If you are using the PDB, see below the useful commands to use on the debugger:"
	@echo "- n: Execute the current line and move to the next one;"
	@echo "- s: Step into the function call on the current line;"
	@echo "- c: Continue execution until the next breakpoint or the end of the program;"
	@echo "- p: Print the value of a variable; Example: p my_variable"
	@echo "- q: Quit the debugger."
	@echo "For more details about IPDB, go to: https://github.com/gotcha/ipdb"
	@echo
	@uv run pytest -k $(q) --pdb --pdbcls=IPython.terminal.debugger:Pdb --disable-warnings

reset-tags tags-reset:  ## Reset git tags
	@git tag -d $(shell git tag) > /dev/null 2>&1; \
	git fetch --tags > /dev/null 2>&1; \
	echo ${LIGHT_GREEN}"The last remote tag is ${LAST_REMOTE_TAG}"${NC}; \
	echo ${LIGHT_GREEN}"The last locally generated tag is ${LAST_LOCAL_TAG}"${NC}

release bump version: reset-tags  ## Generate new version of the project. Example: make version patch
	@echo
	@echo "It is recommended to use Github Actions to create a new version."
	@echo "If you are unsure which version to create, use the command: "${GRAY}"make release-show"${NC}
	@read -p "Do you really want to continue with the $(shell uv run bump-my-version show --increment=$(filter-out $@,$(MAKECMDGOALS)) new_version) build locally? (y/N): " confirm && [ "$$confirm" = "y" ] || exit 1
	@uv run -q bump-my-version bump $(filter-out $@,$(MAKECMDGOALS))
	@echo ${LIGHT_GREEN}"A new tag $(shell uv run bump-my-version show --increment=$(filter-out $@,$(MAKECMDGOALS)) new_version) has been generated."${NC}
	@echo "To finish, create a new branch and open the PR of the new version: "${GRAY}"git checkout -b github-action-release/$(shell uv run bump-my-version show --increment=$(filter-out $@,$(MAKECMDGOALS)) new_version) && git push origin github-action-release/$(shell uv run bump-my-version show --increment=$(filter-out $@,$(MAKECMDGOALS)) new_version) --force --tags --no-verify"${NC}

release-show:  ## Show the possible versions resulting from the bump subcommand.
	@uv run -q bump-my-version show-bump

envvars:  ## Export envvars from config. Ex. $(make envvars)
	@echo "export ${ENVIRONMENT_VARIABLES}"

%:
	@true
