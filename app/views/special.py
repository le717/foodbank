from flask import render_template

from app.blueprints import special


@special.route("/unsupported")
def unsupported_browser():
    return render_template("special/unsupported.html")
