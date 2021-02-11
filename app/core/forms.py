from typing import List, Tuple

from flask_wtf import FlaskForm
from flask_wtf.form import _Auto
from wtforms.fields import (
    BooleanField,
    HiddenField,
    PasswordField,
    RadioField,
    SubmitField,
)
from wtforms.fields.html5 import EmailField
from wtforms.validators import DataRequired, Email

__all__ = ["FormSignIn", "FromForgotPassword", "FromResetPassword"]


class FormSignIn(FlaskForm):
    email = EmailField(
        "Email",
        id="form-signin-email",
        validators=[DataRequired(), Email()],
        render_kw={"placeholder": "your@email.address", "autocomplete": "email"},
    )
    password = PasswordField(
        "Password",
        id="form-signin-password",
        validators=[DataRequired()],
        render_kw={"placeholder": "Password", "autocomplete": "current-password"},
    )
    remember_me = BooleanField("Remember me", id="form-signin-remember")
    submit = SubmitField("Sign in")


class FromForgotPassword(FlaskForm):
    email = EmailField(
        "Email",
        id="form-pass-forgot-email",
        validators=[DataRequired(), Email()],
        render_kw={"placeholder": "your@email.address", "autocomplete": "email"},
    )
    submit = SubmitField("Reset")


class FromResetPassword(FlaskForm):
    token = HiddenField(id="form-token")
    new_password = PasswordField(
        "New password",
        id="form-pass-reset-password",
        validators=[DataRequired()],
        render_kw={"autocomplete": "new-password"},
    )
    confirm_new_password = PasswordField(
        "Confirm new password",
        id="form-pass-reset-password-confirm",
        validators=[DataRequired()],
        render_kw={"autocomplete": "new-password"},
    )
    submit = SubmitField("Reset")


class FormSelectCampus(FlaskForm):
    def __init__(self, formdata=_Auto, **kwargs):
        super().__init__(formdata=formdata, **kwargs)
        radio = RadioField(
            "Select your current campus",
            id="form-campus-select-radio",
            validators=[DataRequired()],
            choices=kwargs["campuses"],
        )

    submit = SubmitField("Select")
