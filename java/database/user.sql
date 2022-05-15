-- ********************************************************************************
-- This script creates the database users and grants them the necessary permissions
-- ********************************************************************************

CREATE USER final_capstone_owner
WITH PASSWORD 'password';

GRANT ALL
ON ALL TABLES IN SCHEMA public
TO final_capstone_owner;

GRANT ALL
ON ALL SEQUENCES IN SCHEMA public
TO ruyahal_owner;

CREATE USER ruyahal_appuser
WITH PASSWORD 'ruyahal';

GRANT SELECT, INSERT, UPDATE, DELETE
ON ALL TABLES IN SCHEMA public
TO ruyahal_appuser;

GRANT USAGE, SELECT
ON ALL SEQUENCES IN SCHEMA public
TO ruyahal_appuser;
