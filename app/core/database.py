from typing import List
from flask import current_app

import records

# from sqlalchemy.exc import IntegrityError


__all__: List[str] = ["get_user_login"]


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


def get_user_login(email_addr: str):
    sql = "SELECT email, password FROM users WHERE email = :email_addr"
    with __connect_to_db() as db:
        return db.query(sql, email_addr=email_addr).one()
