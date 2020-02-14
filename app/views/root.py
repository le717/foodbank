from flask import flash, redirect, render_template, url_for
from flask_login import current_user, login_required, login_user, logout_user

from app.blueprints import root
from app.core.forms import FormSignIn
from app.core import login
from app.core.models import AuthUser
from app.core import redis as redis_utils
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
            # Sign the user in, remembering their login if requested
            user = AuthUser(form.email.data)
            login_user(user, remember=form.remember_me.data)

            # Make a record of the user session
            # TODO Record this login time in the db
            redis_key = redis_utils.make_redis_key(
                redis_utils.RedisKeys.UserSession, user.username, "active"
            )
            redis_client.set(redis_key, "true")
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
    # Remove this user session and sign them out
    current_user.authenticated = False
    redis_key = redis_utils.make_redis_key(
        redis_utils.RedisKeys.UserSession, current_user.username, "active"
    )
    redis_client.delete(redis_key)
    logout_user()
    flash("You have been successfully signed out. Thank you for your service!", "info")
    return redirect(url_for("root.index"))
