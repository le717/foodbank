from flask import abort
from flask_login import current_user


def authorize_user():
    """Determine if the user is allowed to view this endpoint.

    While this method needs to be filled in with your app's
    specific auth requirements in conjunction with the user load.
    """
    if not hasattr(current_user, "username"):
        abort(403)
