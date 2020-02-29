from flask import render_template

from app.blueprints import checkin


@checkin.route("/")
def index():
    render_opts = {}
    return render_template("checkin/index.html", **render_opts)
