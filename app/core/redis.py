from datetime import timedelta
from enum import Enum

__all__ = ["RedisKeys", "KEY_EXPIRE_TIME", "make_key"]


# Default expiry time for a key
KEY_EXPIRE_TIME = timedelta(hours=4)


class RedisKeys(Enum):
    UserSession = "user_session"
    UserData = "user_data"


def make_key(primary_key: RedisKeys, *fields: str) -> str:
    """Build a consistent Redis key from the various given parts."""
    return f"{primary_key.value}/{'/'.join(fields)}"
