from datetime import date
from os import stat
from os.path import join
from typing import Dict

from flask import current_app, _request_ctx_stack  # type: ignore
from flask import render_template


@current_app.context_processor
def inject_app_name() -> Dict[str, str]:
    """Make the app name available in templates."""
    return {"APP_NAME": current_app.config["APP_NAME"]}


@current_app.context_processor
def inject_current_date() -> dict:
    """Make the current available in templates."""
    return {"current_date": date.today()}


@current_app.url_defaults
def cache_buster(endpoint: str, values: dict) -> None:
    """Provide cache busting for static assets."""
    # Only cache bust static assets
    if endpoint == "static":
        filename = values.get("filename")

        # Build up the file path and append the last modified time
        # to the end as a query string. This has the advantage of
        # leveraging the browser cache for files that have no changes
        # for any length of time.
        if filename:
            file_path = join(current_app.root_path, endpoint, filename)
            values["t"] = int(stat(file_path).st_mtime)


@current_app.before_request
def __force_https():
    """Forces the app to assume it's operating using a secure connection.
    This method should only be called in Production.
    """
    if current_app.config["ENV"].lower() == "production":
        if _request_ctx_stack is not None:
            _request_ctx_stack.top.url_adapter.url_scheme = "https"


@current_app.errorhandler(401)
def authorized_error_handler(e) -> tuple:
    return render_template("errors/403.html"), 401


@current_app.errorhandler(403)
def permission_error_handler(e) -> tuple:
    return render_template("errors/403.html"), 403


@current_app.errorhandler(404)
def not_found_handler(e) -> tuple:
    return render_template("errors/404.html"), 404


@current_app.errorhandler(500)
def server_error_handler(e) -> tuple:
    return render_template("errors/500.html"), 500
