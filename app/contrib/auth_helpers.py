from flask import abort
from flask_login import current_user


def authorize_user():
    """Determine if the user is allowed to view this endpoint.

    While this method needs to be filled in with your app's
    specific auth requirements in conjunction with the user load,
    an extremely basic authorization method can be implemented as:

    if not current_user.is_authenticated:
        abort(403)
    """
    if not current_user.is_authenticated:
        abort(403)
