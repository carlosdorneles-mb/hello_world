import json
import sys
from re import compile  # noqa: A004

from bumpversion.config import get_configuration
from bumpversion.config.files import find_config_file
from bumpversion.utils import extract_regex_flags


def main() -> bool:
    """Return true if current version is pre_release"""

    found_config_file = find_config_file()
    config = get_configuration(found_config_file)

    version_pattern = "".join(map(str.strip, config.parse.replace("\\\\", "\\").split("\n")))
    version_pattern, _ = extract_regex_flags(version_pattern)
    tag_regex = compile(f"(?P<current_version>{version_pattern})")
    regex_match = tag_regex.search(str(config.current_version))

    if not regex_match:
        raise ValueError("Invalid bumpversion configuration")

    group_dict = regex_match.groupdict()

    return group_dict.get("pre_release") is not None


if __name__ == "__main__":
    try:
        print(json.dumps(main()))  # noqa: T201
    except Exception as error:
        sys.exit(str(error))
