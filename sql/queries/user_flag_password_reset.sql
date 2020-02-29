UPDATE users
SET
  needs_password_reset = 1,
  temp_password_token = :temp_password_token,
  token_expiry_date = DATE_ADD(CURRENT_TIMESTAMP(), INTERVAL 30 MINUTE)
WHERE
  email = :email_addr;
