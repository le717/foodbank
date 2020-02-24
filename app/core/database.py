from pathlib import Path

from flask import current_app

import records

# from sqlalchemy.exc import IntegrityError


__all__ = ["user_get_login", "reset_user_password"]


def __connect_to_db() -> records.Database:
    """Create a connection to the database."""
    conn_str = "mysql+pymysql://{}:{}@{}/{}".format(
        current_app.config["mysql_user"],
        current_app.config["mysql_password"],
        current_app.config["mysql_host"],
        current_app.config["mysql_dbname"],
    )
    conn = records.Database(conn_str)
    return conn


def __get_sql_script(script_name: str) -> str:
    """Load the contents of a SQL script.

    Throws a FileNotFoundError if the script cannot be found.
    """
    script = Path(f"sql/queries/{script_name}.sql").resolve()
    return script.read_text()


def user_get_login(email_addr: str) -> records.RecordCollection:
    """Get basic user information to determine a successful login attempt."""
    sql = __get_sql_script("user_login")
    with __connect_to_db() as db:
        return db.query(sql, email_addr=email_addr).one()


def reset_user_password(email_addr: str, token: str) -> bool:
    """Reset a user's password."""
    sql = __get_sql_script("user_reset_password")
    with __connect_to_db() as db:
        return db.query(sql, temp_password_token=token, email_addr=email_addr)
    return True
