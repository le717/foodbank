from pathlib import Path
from typing import Optional

from flask import current_app

import records
from sqlalchemy import exc


__all__ = [
    "user_get_login",
    "user_flag_password_reset",
    "user_is_reset_token_valid",
    "user_reset_password",
]


def __connect_to_db() -> records.Database:
    """Create a connection to the database."""
    conn_str = "mysql+pymysql://{}:{}@{}/{}".format(
        current_app.config["mysql_user"],
        current_app.config["mysql_password"],
        current_app.config["mysql_host"],
        current_app.config["mysql_dbname"],
    )
    return records.Database(conn_str)


def __get_sql_script(script_name: str) -> str:
    """Load the contents of a SQL script.

    Throws a FileNotFoundError if the script cannot be found.
    """
    script = (Path() / "sql" / "queries" / f"{script_name}.sql").resolve()
    return script.read_text()


def user_get_login(email_addr: str) -> Optional[records.RecordCollection]:
    """Get basic user information to determine a successful login attempt."""
    sql = __get_sql_script("user_login")
    try:
        with __connect_to_db() as db:
            return db.query(sql, email_addr=email_addr).one()
    except exc.SQLAlchemyError:
        return None


def user_flag_password_reset(email_addr: str, token: str) -> bool:
    """Reset a user's password."""
    sql = __get_sql_script("user_flag_password_reset")
    try:
        with __connect_to_db() as db:
            return db.query(sql, temp_password_token=token, email_addr=email_addr)
    except exc.SQLAlchemyError:
        return False


def user_is_reset_token_valid(token: str) -> bool:
    """Determine if the password reset token is valid."""
    sql = __get_sql_script("user_is_reset_token_valid")
    with __connect_to_db() as db:
        return bool(db.query(sql, token=token).one())


def user_reset_password(token: str, user_pass: str) -> bool:
    """Reset the user's password to the new, specified password."""
    sql = __get_sql_script("user_reset_password")
    try:
        with __connect_to_db() as db:
            db.query(sql, token=token, password=user_pass)
            return True
    except exc.SQLAlchemyError:
        return False
