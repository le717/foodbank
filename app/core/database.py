from pathlib import Path

from flask import current_app

import records

# from sqlalchemy.exc import IntegrityError


__all__ = ["get_user_login"]


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


def get_user_login(email_addr: str) -> records.RecordCollection:
    sql = __get_sql_script("get_user_login")
    with __connect_to_db() as db:
        return db.query(sql, email_addr=email_addr).one()
