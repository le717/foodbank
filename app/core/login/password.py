from passlib.hash import pbkdf2_sha256
from passlib.pwd import genword
from passlib.utils import saslprep


__all__ = ["confirm", "generate_hash", "generate_temp_token"]


def confirm(user_password: str, hashed_password: str) -> bool:
    """Compare the password to the stored password."""
    return pbkdf2_sha256.verify(user_password, hashed_password)


def generate_hash(user_password: str) -> str:
    """Generate a hashed version of the password."""
    return pbkdf2_sha256.hash(saslprep(user_password))


def generate_temp_token() -> str:
    """Generate a temporary token for use in password resets."""
    return genword(entropy="fair")
