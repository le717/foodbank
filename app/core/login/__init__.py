from app.core import database
from app.core.login import password


__all__ = [
    "confirm",
    "has_account",
    "flag_password_reset",
    "is_reset_token_valid",
    "reset_user_password",
]


def confirm(email_addr: str, user_pass: str) -> bool:
    """Confirm a valid email address/password combination."""
    # Attempt to find this user
    user = database.user_get_login(email_addr)
    if user is None:
        return False

    # Do the passwords match and the password reset flag is not set?
    return password.confirm(user_pass, user.password) and not user.needs_password_reset


def has_account(email_addr: str) -> bool:
    """Determine if there's an account with the given email address."""
    user = database.user_get_login(email_addr)
    return bool(user)


def flag_password_reset(email_addr: str) -> str:
    """Flag the user's account as needing a password reset.

    Return the temporary reset token needed to reset the password."""
    token = password.generate_temp_token()
    database.user_flag_password_reset(email_addr, token)
    return token


def is_reset_token_valid(token: str) -> bool:
    """Determine if a reset token is valid."""
    return bool(database.user_is_reset_token_valid(token))


def reset_user_password(token: str, user_pass: str) -> bool:
    """Reset the user's password to their chosen new password."""
    return database.user_reset_password(token, password.generate_hash(user_pass))


def user_record_login_time(email_addr: str) -> bool:
    """Record the user's latest login time."""
    database.user_record_login_time(email_addr)
    return True
