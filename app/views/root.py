from flask import request
from flask import flash, redirect, render_template, url_for
from flask_login import current_user, login_required, login_user, logout_user

from app.blueprints import root
from app.core import email
from app.core import forms
from app.core import login
from app.core.models import AuthUser
from app.core import redis as redis_utils
from app.extensions import redis_client


@root.route("/")
def index():
    # Skip the login page if we are already signed in
    user = current_user
    if hasattr(user, "username"):
        return redirect(url_for("records.campus_select"))

    render_opts = {"form": forms.FormSignIn()}
    return render_template("root/index.html", **render_opts)


@root.route("/forgot-password")
def forgot_password():
    render_opts = {"form": forms.FromForgotPassword()}
    return render_template("root/forgot-password.html", **render_opts)


@root.route("/reset-password")
def reset_password():
    """Process resetting the account password."""
    # The reset token must be present, not expired, or already used
    if "token" not in request.args or not login.is_reset_token_valid(
        request.args["token"]
    ):
        flash("It seems this password reset has already been used.", "error")
        return redirect(url_for("root.index"))

    render_opts = {"form": forms.FromResetPassword()}
    render_opts["form"].token.data = request.args["token"]
    return render_template("root/reset-password.html", **render_opts)


@root.route("/password-test", methods=["POST"])
def test_password_strength():
    """Test a pasword's strength and security."""
    # TODO Implement AJAX route for testing password strength via zxcvbn
    return ""


@root.route("/reset-the-password", methods=["POST"])
def process_reset_password():
    """Password reset page."""
    form = forms.FromResetPassword()
    # The form did not validate correctly
    if not form.validate_on_submit():
        flash(
            "Please be sure to fill out both fields to reset your password into the Lighthouse.",
            "info",
        )
        return redirect(url_for("root.reset_password", token=form.token.data))

    # Finally, reset the password and report the results
    r = login.reset_user_password(form.token.data, form.confirm_new_password.data)
    if r:
        flash("Password reset successfully!", "info")
    else:
        flash("Weird. We couldn't reset your password. Please retry later.", "error")
    return redirect(url_for("root.index"))


@root.route("/forget-the-password", methods=["POST"])
def process_forgot_password():
    """Process a request to reset an account password."""
    # Define the return URL here to permit early returns
    return_url = redirect(url_for("root.forgot_password"))

    # The form was not filled out
    form = forms.FromForgotPassword()
    if not form.validate_on_submit():
        flash(
            "Please provide your email address so we can reset your password.", "error",
        )
        return return_url

    # We have an email address in the form!
    # Now confirm that email is even in the database
    if not login.has_account(form.email.data):
        flash(
            "Huh, we can't find that one. Pleae enter the email address connected to your account.",
            "error",
        )
        return return_url

    # Process the reset request and get the reset token
    reset_token = login.flag_password_reset(form.email.data)

    # Generate and send out a password reset email
    email_render_opts = {
        "password_reset_url": url_for(
            "root.reset_password", token=reset_token, _external=True
        )
    }
    r = email.make_and_send(
        form.email.data,
        "Reset your Lighthouse password",
        "reset-password",
        **email_render_opts,
    )

    # Report the email sending success status
    if r:
        flash(f"Password reset email successfully sent to {form.email.data}! 🎉", "info")
    else:
        flash(
            "Hmmm, there was an issue sending out a reset email. 🤔 Try again shortly, please.",
            "error",
        )
    return return_url


@root.route("/signin", methods=["POST"])
def sign_in():
    """Log the user into the system."""
    # Attempt to process the form
    form = forms.FormSignIn()
    if form.validate_on_submit():
        # The login was correct
        if login.confirm(form.email.data, form.password.data):
            # Sign the user in, remembering their login if requested
            user = AuthUser(form.email.data)
            login_user(user, remember=form.remember_me.data)

            # Make a record of the user session
            login.user_record_login_time(form.email.data)

            # TODO Load the user info

            # Record the user session and set it to expire
            # at the default expire time
            redis_key = redis_utils.make_redis_key(
                redis_utils.RedisKeys.UserSession, user.username, "active"
            )
            redis_client.setex(redis_key, redis_utils.KEY_EXPIRE_TIME, "true")
            return redirect(url_for("records.campus_select"))

        # If the login info was not valid, let the user know
        flash("The username or password was incorrectly entered.", "error")
        return redirect(url_for("root.index"))

    # The form was not filled out
    flash("You must sign in to continue. 😉", "error")
    return redirect(url_for("root.index"))


@root.route("/signout", methods=["GET"])
@login_required
def sign_out():
    """Log the user out of the system."""
    # Delete all of the user's keys in Redis
    for key in redis_utils.RedisKeys:
        redis_key = redis_utils.make_redis_key(key, current_user.username, "active")
        redis_client.delete(redis_key)

    # Remove this user session and sign them out
    current_user.authenticated = False
    logout_user()
    flash("You have successfully signed out. Thank you for serving!", "info")
    return redirect(url_for("root.index"))
