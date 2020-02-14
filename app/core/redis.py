from enum import Enum

__all__ = ["RedisKeys", "make_redis_key"]


class RedisKeys(Enum):
    UserSession = "user_session"


def make_redis_key(primary_key: RedisKeys, *fields: str) -> str:
    return f"{primary_key.value}/{'/'.join(fields)}"
