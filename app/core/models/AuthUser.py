from flask_login import UserMixin


class AuthUser(UserMixin):
    def __init__(self, username):
        self.username = username
        self.authenticated = True

    def is_authenticated(self):
        return self.authenticated

    def is_anonymous(self):
        return False

    def is_active(self):
        return True

    def get_id(self):
        return self.username
