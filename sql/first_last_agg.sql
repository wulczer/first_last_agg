CREATE OR REPLACE FUNCTION last_sfunc(anyelement, anyelement)
RETURNS anyelement
AS '$libdir/first_last_agg', 'last_sfunc'
LANGUAGE C IMMUTABLE STRICT;

CREATE OR REPLACE FUNCTION first_sfunc(anyelement, anyelement)
RETURNS anyelement
AS '$libdir/first_last_agg', 'first_sfunc'
LANGUAGE C IMMUTABLE STRICT;

DROP AGGREGATE IF EXISTS first(anyelement);
CREATE AGGREGATE first(anyelement) (
    SFUNC = first_sfunc,
    STYPE = anyelement
);

DROP AGGREGATE IF EXISTS last(anyelement);
CREATE AGGREGATE last(anyelement) (
    SFUNC = last_sfunc,
    STYPE = anyelement
);


DO $$
DECLARE version_num integer;
BEGIN
  SELECT current_setting('server_version_num') INTO STRICT version_num;
  IF version_num > 90600 THEN
    EXECUTE $E$  ALTER FUNCTION last_sfunc(anyelement, anyelement) PARALLEL SAFE   $E$;
    EXECUTE $E$ ALTER FUNCTION first_sfunc(anyelement, anyelement) PARALLEL SAFE   $E$;

    EXECUTE $E$ DROP AGGREGATE IF EXISTS first(anyelement) $E$;
    EXECUTE $E$ CREATE AGGREGATE first(anyelement) (
        SFUNC = first_sfunc,
        STYPE = anyelement,
        COMBINEFUNC = first_sfunc,
        parallel = SAFE
    ); $E$;

    EXECUTE $E$ DROP AGGREGATE IF EXISTS last(anyelement) $E$;
    EXECUTE $E$ CREATE AGGREGATE last(anyelement) (
        SFUNC = last_sfunc,
        STYPE = anyelement,
        COMBINEFUNC = last_sfunc,
        parallel = SAFE
    ); $E$;
  END IF;
END;
$$;