from typing import Optional

from app.core import database
from app.core.login import password


__all__ = ["confirm", "has_account"]


def confirm(email_addr: str, user_pass: str) -> Optional[bool]:
    """Confirm a valid email address/password combination."""
    # Attempt to find this user
    user = database.user_get_login(email_addr)
    if user is None:
        return None

    # Do the passwords match and the password reset flag is not set?
    return password.confirm(user_pass, user.password) and not user.needs_password_reset


def has_account(email_addr: str) -> bool:
    """Determine if there's an account with the given email address."""
    user = database.user_get_login(email_addr)
    return True if user is not None else False


def flag_password_reset(email_addr: str) -> str:
    """Flag the user's account as needing a password reset.

    Return the temporary reset token needed to reset the password."""
    token = password.generate_temp_token()
    database.user_flag_password_reset(email_addr, token)
    return token
