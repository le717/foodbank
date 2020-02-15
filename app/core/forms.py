from flask_wtf import FlaskForm
from wtforms.fields import BooleanField, PasswordField, SubmitField
from wtforms.fields.html5 import EmailField
from wtforms.validators import DataRequired, Email


__all__ = ["FormSignIn"]


class FormSignIn(FlaskForm):
    email = EmailField(
        "Email",
        id="form-signin-email",
        validators=[DataRequired(), Email()],
        render_kw={"placeholder": "your@email.address"},
    )
    password = PasswordField(
        "Password", id="form-signin-password", validators=[DataRequired()]
    )
    remember_me = BooleanField("Stay signed in", id="form-signin-remember")
    submit = SubmitField("Submit")
