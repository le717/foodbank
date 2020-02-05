from flask_jsglue import JSGlue
from flask_login import LoginManager
from flask_redis import FlaskRedis


jsglue = JSGlue()
login_manager = LoginManager()
login_manager.session_protection = "strong"
redis_client = FlaskRedis()


def init_extensions(app):
    jsglue.init_app(app)
    login_manager.init_app(app)
    redis_client.init_app(app)
