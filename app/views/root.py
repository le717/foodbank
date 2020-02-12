from flask import render_template

from app.blueprints import root
from app.core.forms import FormSignIn


@root.route("/")
def index():
    render_opts = {"form": FormSignIn()}
    return render_template("root/index.html", **render_opts)


@root.route("/signin")
def sign_in():
    return "sign_in"
