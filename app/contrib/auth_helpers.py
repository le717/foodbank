from app.core.login import is_user_logged_in

from flask import abort


def authorize_user():
    """Determine if the user is allowed to view this endpoint.

    While this method needs to be filled in with your app's
    specific auth requirements in conjunction with the user load.
    """
    if not is_user_logged_in():
        abort(403)
