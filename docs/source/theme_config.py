colors = {
    "bg0": " #fbf1c7",
    "bg1": " #ebdbb2",
    "bg2": " #d5c4a1",
    "bg3": " #bdae93",
    "bg4": " #a89984",
    "gry": " #928374",
    "fg5": " #f6f6f6",
    "fg4": " #7c6f64",
    "fg3": " #665c54",
    "fg2": " #504945",
    "fg1": " #3c3836",
    "fg0": " #282828",
    "red": " #cc241d",
    "red2": " #9d0006",
    "orange": " #ef4723",
    "orange2": " #ff2f03",
    "yellow": " #d79921",
    "yellow2": " #b57614",
    "green": " #98971a",
    "green2": " #79740e",
    "aqua": " #689d6a",
    "aqua2": " #427b58",
    "blue": " #458588",
    "blue2": " #076678",
    "purple": " #b16286",
    "purple2": " #8f3f71",
}

html_theme = "furo"
html_theme_options = {
    "light_css_variables": {
        "font-stack": "Fira Sans, sans-serif",
        "font-stack--monospace": "Fira Code, monospace",
        "color-brand-primary": colors["orange2"],
        "color-brand-content": colors["blue2"],
    },
    "dark_css_variables": {
        "color-brand-primary": colors["orange"],
        "color-brand-content": colors["blue"],
    },
}

highlight_language = "python3"
pygments_style = "gruvbox-light"
pygments_dark_style = "gruvbox-dark"
