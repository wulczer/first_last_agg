ALTER EXTENSION first_last_agg ADD FUNCTION first_sfunc(anyelement, anyelement);
ALTER EXTENSION first_last_agg ADD FUNCTION last_sfunc(anyelement, anyelement);
ALTER EXTENSION first_last_agg ADD AGGREGATE last(anyelement);
ALTER EXTENSION first_last_agg ADD AGGREGATE first(anyelement);
