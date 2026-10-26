SHOW port;
SHOW listen_addresses;
SHOW password_encryption;
SHOW ssl;

SELECT
    type,
    database,
    user_name,
    address,
    auth_method
FROM pg_hba_file_rules;

SELECT
    rolname,
    rolsuper,
    rolcreaterole,
    rolcreatedb,
    rolcanlogin
FROM pg_roles
ORDER BY rolname;

SELECT extname, extversion
FROM pg_extension
ORDER BY extname;