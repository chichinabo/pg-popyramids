

/*
* Add comments
*/
CREATE OR REPLACE FUNCTION refresh_all_views()
RETURNS TRIGGER LANGUAGE plpgsql
AS $$
BEGIN
	--refresh materialized views concurrently in dms;
    	RETURN null;
END $$;


CREATE TRIGGER refresh_all_views
AFTER INSERT OR UPDATE OR DELETE OR TRUNCATE
ON dms.main FOR EACH STATEMENT 
EXECUTE PROCEDURE refresh_all_views();


