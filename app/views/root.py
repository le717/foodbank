from flask import flash, redirect, render_template, url_for
from flask_login import current_user, login_required, login_user, logout_user

from app.blueprints import root
from app.core.forms import FormSignIn
from app.core.helpers import make_redis_user_key
from app.core import login
from app.core.models import AuthUser
from app.extensions import redis_client


@root.route("/")
def index():
    render_opts = {"form": FormSignIn()}
    return render_template("root/index.html", **render_opts)


@root.route("/signin", methods=["POST"])
def sign_in():
    # Attempt to process the form
    form = FormSignIn()
    if form.validate_on_submit():
        # The login was correct
        if login.confirm(form.email.data, form.password.data):
            user = AuthUser(form.email.data)
            login_user(user, remember=False)
            redis_client.hset(
                make_redis_user_key("active_users", user.username), "active", "true"
            )
            return redirect(url_for("root.campus_select"))

        # If the login info was not valid, let the user know
        flash("The username or password was incorrectly entered.", "error")
        return redirect(url_for("root.index"))

    # The form was not filled out
    flash("You must sign in to continue. 😉", "error")
    return redirect(url_for("root.index"))


@root.route("/campus-select")
@login_required
def campus_select():
    return f"Welcome to Lighthouse, {current_user.username}!"


@root.route("/signout", methods=["GET"])
@login_required
def sign_out():
    current_user.authenticated = False
    redis_client.delete(make_redis_user_key("active_users", current_user.username))
    logout_user()
    return "signed out"
