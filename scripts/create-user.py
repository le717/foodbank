import importlib.util
from pathlib import Path
from secrets import token_hex
import sys


# Import the database module
db_spec = importlib.util.spec_from_file_location(
    "database", Path("app/core/database.py").resolve()
)
database = importlib.util.module_from_spec(db_spec)
sys.modules["database"] = database
db_spec.loader.exec_module(database)  # type: ignore

# Import the password module
password_spec = importlib.util.spec_from_file_location(
    "password", Path("app/core/login/password.py").resolve()
)
password = importlib.util.module_from_spec(password_spec)
sys.modules["password"] = password
password_spec.loader.exec_module(password)  # type: ignore

# Define the possible roles
user_roles = {"a": "admin", "m": "member (default)"}


def __get_email_addr() -> str:
    """Get the user's email address."""
    valid_email = False
    while not valid_email:
        if (email_addr := input("Please enter the email address: ")) :
            valid_email = True
    return email_addr


def __get_org_list():
    sql = """SELECT * FROM organizations"""
    # with wsgi.app.app_context():
    #     with database._connect_to_db() as db:
    #         return db.query(sql).all()


def main():
    print("## Add a user to Lighthouse ##\n")

    # Ask for the user's information
    # TODO Pull org list
    print(__get_org_list())
    org_id = input("Please select your organization: ")
    user_name = input("Please enter their name: ")
    email_addr = __get_email_addr()

    # Get the roles
    print("\nWhat is their role? (Leave blank for default)")
    for code, role in user_roles.items():
        print(f"[{code[0]}] {role.capitalize()}")
    user_role = input("Role: ")
    user_role = user_roles.get(user_role, user_roles["m"])
    user_role = user_role.replace("(default)", "").strip()

    # Confirm everything is correct
    print("\nLet's review what you entered")
    print(f"Organization: {org_id}")
    print(f"Name: {user_name}")
    print(f"Email: {email_addr}")
    print(f"Role: {user_role}")
    all_info_right = input("Is this correct? [Y/n] ")

    # Everything is correctly entered
    if all_info_right.upper() == "Y":
        # Generate a user id and temporary password
        user_id = token_hex(18)
        temp_token = password.generate_temp_token()
        return True
    print("Aborting new user creation...")
    return False


if __name__ == "__main__":
    main()
