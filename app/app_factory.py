from importlib import import_module

from flask import Flask

from app.blueprints import all_blueprints
import app.configuration as config
from app.extensions import init_extensions


def create_app() -> Flask:
    app = Flask(__name__)

    # Load the app configuration
    app.config.update(config.get_app_config("default.json"))
    app.config.update(config.get_app_config(
        config.get_app_config_file(app.config["ENV"])
    ))

    # Set the app's secret key
    for key in sorted(app.config):
        # Find the secret that ends with "SECRET_KEY" in the name.
        # That's most likely our secret key. If there's more than one
        # key that matches this, this will pick up the first one
        if key.endswith("SECRET_KEY"):
            app.config["SECRET_KEY"] = app.config[key]

            # Now that we've set the key, remove the duplicate key
            del app.config[key]
            break

    # Load the extensions
    init_extensions(app)

    # Register the blueprints
    for bp in all_blueprints:
        import_module(bp.import_name)
        app.register_blueprint(bp)

    # Load any injection/special app handler methods
    with app.app_context():
        import_module("app.middleware")

    return app
