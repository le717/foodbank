from typing import Optional

from app.core import database
from app.core.login import password


__all__ = ["confirm"]


def confirm(email_addr: str, user_pass: str) -> Optional[bool]:
    """Confirm a valid email address/password combination."""
    # Attempt to find this user
    user = database.user_get_login(email_addr)
    if user is None:
        return None

    # Do the passwords match?
    return password.confirm(user_pass, user.password)
