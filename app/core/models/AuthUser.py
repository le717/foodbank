from flask_login import UserMixin


class AuthUser(UserMixin):
    def __init__(self, username):
        self.username = username
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
