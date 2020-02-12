from flask_wtf import FlaskForm
from wtforms.fields import PasswordField, SubmitField
from wtforms.fields.html5 import EmailField
from wtforms.validators import DataRequired, Email


__all__ = ["FormSignIn"]


class FormSignIn(FlaskForm):
    email = EmailField(
        "Email",
        id="form-signin-email",
        validators=[DataRequired(), Email()],
        render_kw={"placeholder": "your@email.addr"},
    )
    password = PasswordField(
        "Password", id="form-signin-password", validators=[DataRequired()]
    )
    submit = SubmitField("Submit")
