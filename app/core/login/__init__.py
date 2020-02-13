from typing import Optional

from app.core.database import get_user_login
from app.core.login import password


__all__ = ["confirm"]


def confirm(email_addr: str, user_pass: str) -> Optional[bool]:
    # Attempt to find this user
    user = get_user_login(email_addr)
    if user is None:
        return None

    # Do the passwords match?
    return password.confirm(user_pass, user.password)
