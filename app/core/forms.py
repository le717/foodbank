from flask_wtf import FlaskForm
from wtforms.fields import BooleanField, PasswordField, SubmitField
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
        render_kw={"placeholder": "•••••••••", "autocomplete": "current-password"},
    )
    remember_me = BooleanField("Remember me", id="form-signin-remember")
    submit = SubmitField("Sign in")


class FromForgotPassword(FlaskForm):
    email = EmailField(
        "Email",
        id="form-signin-email",
        validators=[DataRequired(), Email()],
        render_kw={"placeholder": "your@email.address", "autocomplete": "email"},
    )
    submit = SubmitField("Reset password")


class FromResetPassword(FlaskForm):
    new_password = PasswordField(
        "New password",
        id="form-signin-password",
        validators=[DataRequired()],
        render_kw={"autocomplete": "new-password"},
    )
    confirm_new_password = PasswordField(
        "Confirm new password",
        id="form-signin-password",
        validators=[DataRequired()],
        render_kw={"autocomplete": "new-password"},
    )
    submit = SubmitField("Submit")
