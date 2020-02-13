from typing import Optional

from flask_jsglue import JSGlue
from flask_login import LoginManager
from flask_redis import FlaskRedis

from app.core.models import AuthUser


jsglue = JSGlue()
login_manager = LoginManager()
login_manager.session_protection = "strong"
redis_client = FlaskRedis()


def init_extensions(app):
    jsglue.init_app(app)
    login_manager.init_app(app)
    redis_client.init_app(app)


@login_manager.user_loader
def user_loader(username: str) -> Optional[AuthUser]:
    if redis_client.hget(f"active_users/{username}", "active") is None:
        return None
    user = AuthUser(username)
    return user
