import sys
import pathlib

from datetime import UTC, datetime

sys.path.insert(0, pathlib.Path(__file__).parents[2].joinpath("hello_world").resolve().as_posix())
sys.path.insert(0, pathlib.Path(__file__).parents[0].resolve().as_posix())

from theme_config import *  # noqa

# ---- Project Information ----

project = "Hello World"
version = "0.0.0"
release = version

copyright = f"{datetime.now(UTC).year}, Mercado Bitcoin"
author = "Carlos Dorneles <carlos.dorneles@mb.com.br>"

# ---- General Configuration ----

extensions = [
    "sphinx.ext.intersphinx",
    "sphinx.ext.viewcode",
    "sphinx.ext.inheritance_diagram",
    "sphinx.ext.graphviz",
    "sphinx.ext.autosummary",
    "sphinx.ext.coverage",
    "sphinx.ext.autodoc",
    "sphinx.ext.napoleon",
    "sphinx_autodoc_typehints",
    "sphinxcontrib.mermaid",
    "sphinx_inline_tabs",
    "sphinx-jsonschema",
    "sphinxemoji.sphinxemoji",
    "sphinx_copybutton",
    "versionwarning.extension",
    "sphinxext.opengraph",
    "sphinxcontrib.autodoc_pydantic",
    "enum_tools.autoenum",
    "myst_parser",
]
source_parsers = {
    ".md": "recommonmark.parser.CommonMarkParser",
}
source_suffix = {
    ".rst": "restructuredtext",
    ".txt": "restructuredtext",
    ".md": "markdown",
}
root_doc = "index"
templates_path = ["_templates"]
include_patterns = ["**", "../../README.rst", "../../CHANGELOG.md"]
exclude_patterns = ["build", "_templates", "Thumbs.db", ".DS_Store", ".venv"]
suppress_warnings = ["ref.python"]

viewcode_follow_imported_members = True
viewcode_line_numbers = True

mermaid_version = "latest"
mermaid_include_elk = "latest"
mermaid_d3_zoom = True

tls_verify = False
intersphinx_mapping = {
    "attrs": ("https://www.attrs.org/en/stable/", None),
    "python": ("https://docs.python.org/3", None),
}
intersphinx_aliases = {
    "python": ("https://docs.python.org/3", "https://docs.python.org/3/objects.inv"),
}

autoclass_content = "class"
autodoc_member_order = "bysource"
autodoc_default_options = {
    "show-inheritance": True,
    "private-members": False,
    "exclude-members": "_*",
}
autodoc_inherit_docstrings = False
autodoc_pydantic_model_show_json = True
autodoc_pydantic_settings_show_json = True

always_document_param_types = True
always_use_bars_union = True

copybutton_exclude = ".linenos, .gp, ipython, ipythonconsole, python, pythonconsole, console, bash"

html_title = f'{project} <small><b style="color: var(--color-brand-primary)">{{{release}}}</b></small>'
html_theme = "furo"
html_static_path = ["_static"]
html_css_files = [
    "custom.css",
    "https://fonts.googleapis.com/css2?family=Fira+Code:wght@300;400;700&family=Fira+Sans:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap",  # noqa
]
html_logo = "_static/mb-logo.png"
html_favicon = "_static/favicon.png"
html_show_sphinx = True
html_domain_indices = True
html_permalinks_icon = "¶"  # Furo's default permalink icon is `#` which doesn"t look great imo.
