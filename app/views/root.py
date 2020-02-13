from flask import flash, redirect, render_template, url_for

from app.blueprints import root
from app.core.forms import FormSignIn
from app.core import login


@root.route("/")
def index():
    render_opts = {"form": FormSignIn()}
    return render_template("root/index.html", **render_opts)


@root.route("/signin", methods=["POST"])
def sign_in():
    # Attempt to process the form
    form = FormSignIn()
    if form.validate_on_submit():
        # If the login info was not valid, let the user know
        if not login.confirm(form.email.data, form.password.data):
            flash("The username or password was incorrectly entered.", "error")
            return redirect(url_for("root.index"))

        # The login was correct
        return f"Welcome to Lighthouse, {form.email.data}! "

    # The form was not filled out
    flash("You must sign in to continue. 😉", "error")
    return redirect(url_for("root.index"))
