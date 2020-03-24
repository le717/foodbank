from flask import render_template

from app.blueprints import records


@records.route("/")
def index():
    render_opts = {}
    return render_template("records/index.html", **render_opts)
