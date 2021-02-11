SELECT users.user_id, users.name, users.email,
       users.role_id, user_roles.title,
       organizations._id AS org_id, organizations.name AS org_name
FROM users
  INNER JOIN user_roles
    ON users.role_id = user_roles._id
  INNER JOIN organizations
    ON users.org_id = organizations._id
WHERE users.email = :email_addr;
