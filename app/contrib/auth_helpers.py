from typing import Optional

from flask import current_app
from flask_login import current_user, LoginManager, UserMixin

from app.extensions import login_manager


class User(UserMixin):
    def __init__(self, username):
        self.username = username
        self.is_authenticated = True
        self.is_active = True
        self.is_anonymous = False

    def is_authenticated(self):
        return self.is_authenticated

    def is_anonymous(self):
        return self.is_anonymous

    def is_active(self):
        return self.is_active

    def get_id(self):
        return self.username


@login_manager.user_loader
def user_loader(username: str) -> Optional[User]:
    # TODO Fill this method in with your app's auth requirements
    user = User(username)
    if user:
        return user


def authorize_user():
    """Determine if the user is allowed to view this endpoint.

    While this method needs to be filled in with your app's
    specific auth requirements in conjunction with the user load,
    an extremely basic authorization method can be implemented as:

    if not current_user.is_authenticated:
        abort(403)
    """
    pass
