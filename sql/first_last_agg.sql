CREATE OR REPLACE FUNCTION last_sfunc(anyelement, anyelement)
RETURNS anyelement
AS '$libdir/first-last-agg', 'last_sfunc'
LANGUAGE C IMMUTABLE STRICT;

CREATE OR REPLACE FUNCTION first_sfunc(anyelement, anyelement)
RETURNS anyelement
AS '$libdir/first-last-agg', 'first_sfunc'
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
