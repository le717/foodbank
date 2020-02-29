SELECT email, `password`, needs_password_reset
FROM users
WHERE email = :email_addr;
