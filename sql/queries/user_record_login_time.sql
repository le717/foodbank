UPDATE users
SET date_last_login = CURRENT_TIMESTAMP()
WHERE email = :email_addr;
