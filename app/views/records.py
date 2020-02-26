from flask import url_for, render_template
from flask_login import current_user

from app.blueprints import records


@records.route("/")
def index():
    render_opts = {}
    return render_template("records/index.html", **render_opts)


@records.route("/campus-select")
def campus_select():
    return f"""Welcome to Lighthouse, {current_user.username}!
    <br><a href="{url_for('root.sign_out')}">sign out</a>"""
