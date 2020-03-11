from flask_login import UserMixin


class AuthUser(UserMixin):
    def __init__(self, username: str, token: str):
        self.username = username
        self.signin_token = token
        self.authenticated = True

    def is_authenticated(self):
        return self.authenticated

    @staticmethod
    def is_anonymous():
        return False

    @staticmethod
    def is_active():
        return True

    def get_id(self):
        return self.username
