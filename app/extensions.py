from typing import Optional

from flask_jsglue import JSGlue
from flask_login import LoginManager
from flask_redis import FlaskRedis

from app.core.models import AuthUser
from app.core import redis as redis_utils


jsglue = JSGlue()
login_manager = LoginManager()
login_manager.session_protection = "strong"
redis_client = FlaskRedis()


def init_extensions(app):
    """Register and enable Flask extensions."""
    jsglue.init_app(app)
    login_manager.init_app(app)
    redis_client.init_app(app)


@login_manager.user_loader
def user_loader(username: str) -> Optional[AuthUser]:
    """Determine if a user has the proper authentication."""
    redis_key = redis_utils.make_redis_key(
        redis_utils.RedisKeys.UserSession, username, "active"
    )
    if redis_client.get(redis_key) is None:
        return None
    user = AuthUser(username)
    return user
