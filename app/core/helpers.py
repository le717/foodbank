__all__ = ["make_redis_user_key"]


def make_redis_user_key(*keys: str) -> str:
    return "/".join(keys)
