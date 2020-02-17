import datetime
import importlib.util
from os import environ
from pathlib import Path
from secrets import token_hex
import sys

import records


def __load_module(path: Path, module_name: str):
    spec = importlib.util.spec_from_file_location(module_name, path.resolve())
    module = importlib.util.module_from_spec(spec)
    sys.modules[module_name] = module
    spec.loader.exec_module(module)  # type: ignore
    return module


def connect_to_db() -> records.Database:
    """Create a connection to the database."""
    conn_str = "mysql+pymysql://{}:{}@{}/{}".format(
        CONFIG["mysql_user"],
        CONFIG["mysql_password"],
        CONFIG["mysql_host"],
        CONFIG["mysql_dbname"],
    )
    conn = records.Database(conn_str)
    return conn


def get_sql_script(script_name: str) -> str:
    """Load the contents of a SQL script.

    Throws a FileNotFoundError if the script cannot be found.
    """
    script = Path(f"sql/queries/{script_name}.sql").resolve()
    return script.read_text()


def __get_email_addr() -> str:
    """Get the user's email address."""
    valid_email = False
    while not valid_email:
        if (email_addr := input("Please enter the email address: ")) :
            valid_email = True
    return email_addr


def __get_user_org() -> str:
    """Get the user's organization."""
    valid_org = False
    while not valid_org:
        org_id = input("Please select your organization's ID: ")
        if org_id and org_id in ORG_LIST:
            valid_org = True
        else:
            print("Please select a valid organization ID\n")
    return org_id


def __get_org_list():
    sql = """SELECT * FROM organizations"""
    with connect_to_db() as db:
        return db.query(sql)


# Set an alternate secrets path
is_alt_secrets_path = False
if "DOCKER_SECRETS_PATH" not in environ:
    environ["DOCKER_SECRETS_PATH"] = "./secrets"
    is_alt_secrets_path = True

# Import the app's modules
password = __load_module(Path("app/core/login/password.py"), "password")
configuration = __load_module(Path("app/configuration.py"), "configuration")

# Define the possible roles
USER_ROLES = {"a": "admin", "m": "member (default)"}
CONFIG = configuration.get_app_config("default.json")
ORG_LIST = {
    str(org._id): {"_id": org._id, "name": org.name} for org in __get_org_list()
}


def main():
    # Display the current organizations
    print("## Add a user to Lighthouse ##\n")
    print("Available organizations")
    for org in __get_org_list():
        print(f"[{org._id}] {org.name}")

    # Ask for the user's information
    print()
    org_id = __get_user_org()
    user_name = input("Please enter their name: ")
    user_email = __get_email_addr()

    # Get the roles
    print("\nWhat is their role? (Leave blank for default)")
    for code, role in USER_ROLES.items():
        print(f"[{code[0]}] {role.capitalize()}")
    user_role = input("Role: ")
    user_role = USER_ROLES.get(user_role, USER_ROLES["m"])
    user_role = user_role.replace("(default)", "").strip()

    # Confirm everything is correct
    print("\nLet's review what you entered")
    print(f"Organization: {ORG_LIST[str(org_id)]['name']}")
    print(f"Name: {user_name}")
    print(f"Email: {user_email}")
    print(f"Role: {user_role}")
    all_info_right = input("Is this correct? [y/N] ")

    # Everything is correctly entered
    if all_info_right.upper() != "Y":
        print("Aborting new user creation...")
        return False

    # Generate a user id and temporary password
    user_id = token_hex(18)
    temp_token = password.generate_temp_token()

    # Add the information to the database
    with connect_to_db() as db:
        db.query(
            get_sql_script("user_create_new"),
            **{
                "user_id": user_id,
                "name": user_name,
                "email": user_email,
                "password": password.generate_temp_token(),
                "role": user_role,
                "org_id": org_id,
            },
        )
        db.query(
            get_sql_script("user_reset_password"),
            **{"temp_password_token": temp_token, "user_id": user_id,},
        )

    # Remove the alternate secrets path if needed
    if is_alt_secrets_path:
        del environ["DOCKER_SECRETS_PATH"]
    print("User successfully added!")
    return True


if __name__ == "__main__":
    main()
