from flask_jsglue import JSGlue
from flask_login import LoginManager


jsglue = JSGlue()
login_manager = LoginManager()
login_manager.session_protection = "strong"


def init_extensions(app):
    jsglue.init_app(app)
    login_manager.init_app(app)
