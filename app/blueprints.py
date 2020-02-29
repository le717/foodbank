from typing import Callable, Optional

from flask import Blueprint

from app.contrib.auth_helpers import authorize_user


def _factory(
    partial_module_string: str,
    url_prefix: str,
    login_required: bool = False,
    auth_function: Optional[Callable] = None,
) -> Blueprint:
    import_name = f"app.views.{partial_module_string}"
    blueprint = Blueprint(partial_module_string, import_name, url_prefix=url_prefix)

    # This blueprint can only be accessed via a login
    if login_required and auth_function is not None:
        blueprint.before_request(auth_function)

    return blueprint


root = _factory("root", "/")
records = _factory("records", "/records", True, authorize_user)
checkin = _factory("checkin", "/checkin", True, authorize_user)

all_blueprints = (root, records, checkin)
