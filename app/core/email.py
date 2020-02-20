from os import fspath
from pathlib import Path
from typing import Dict

import requests

from flask import current_app
from flask import render_template


__all__ = ["construct", "render", "send"]


def construct(content: dict, addr: str) -> dict:
    """Construct a Mailgun individual email dictionary."""
    return {
        "from": f'{current_app.config["SITE_TITLE"]} <noreply@{current_app.config["APP_DOMAIN"]}>',
        "to": addr,
        "subject": content["subject"],
        "text": content["text"],
        "html": content["html"],
    }


def render(template_name: str, render_opts: dict) -> Dict[str, str]:
    """Render a email template with all info."""
    rendered = {
        "html": render_template(
            fspath(Path(f"emails/{template_name}.jinja2")), **render_opts
        ),
        "text": render_template(
            fspath(Path(f"emails/{template_name}.txt")), **render_opts
        ),
    }
    return rendered


def send(email: Dict[str, str]) -> bool:
    try:
        r = requests.post(
            f'https://api.mailgun.net/v3/{current_app.config["MG_DOMAIN"]}/messages',
            auth=("api", current_app.config["MG_API_KEY"]),
            data=email,
        )
        r.raise_for_status()
        print(r)
        return True

    # Some error occurred while attempting to send the email
    except Exception as exc:
        print(exc)
    return False
