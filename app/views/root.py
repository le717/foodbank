from flask import request
from flask import render_template

from webargs import fields
from webargs.flaskparser import use_args

from app.blueprints import root
from app.core.database import test_method


@root.route("/")
def index():
    return render_template("root/index.html", data=test_method())


@root.route("/search", methods=["GET", "POST"])
@use_args({"search_query": fields.Str(required=True)})
def search(args: dict):
    return f"search_query: {args['search_query']}"
