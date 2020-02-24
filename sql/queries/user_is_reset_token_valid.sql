SELECT user_id
FROM users
WHERE temp_password_token = :token
  AND needs_password_reset = 1
  AND CURRENT_TIMESTAMP() <= token_expiry_date;
