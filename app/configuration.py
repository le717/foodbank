import os
import json

import sys_vars


__all__ = ["get_app_config", "get_app_config_file"]


def get_app_config_file(env: str) -> str:
    """Determine the appropriate config file for the environment.

    @param {str} env - The currently set value of ENV.
    @return {str} - The config file name for the environment.
    """
    return f"{env}.json"


def get_app_config(config_file: str) -> dict:
    """Collect the app configuration values.

    @param {str} config_file - The config file name to use.
    @return {dict} - A dictionary with all config values.
    """
    with open(os.path.join("configuration", config_file), "rt") as f:
        file_content = json.loads(f.read())

    # Immediately add the app-specific values to the final values
    # because there is no need to fetch these from an outside source
    app_config = {}
    app_config.update(file_content["appConfig"])

    # Now fetch the system variable stored in a outside source
    # if they are defined at all
    sys_vars = file_content.get("env", []) + file_content.get("secrets", [])
    for var in sys_vars:
        app_config[var] = sys_vars.get(var)

    return app_config
