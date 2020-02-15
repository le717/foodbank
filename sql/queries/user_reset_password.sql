UPDATE users
SET
  needs_password_reset = 1,
  temp_password_token = :temp_password_token,
  token_expiry_date = :token_expiry_date
WHERE
  user_id = :user_id;
