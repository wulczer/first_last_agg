ALTER EXTENSION "first-last-agg" ADD FUNCTION first_sfunc(anyelement, anyelement);
ALTER EXTENSION "first-last-agg" ADD FUNCTION last_sfunc(anyelement, anyelement);
ALTER EXTENSION "first-last-agg" ADD AGGREGATE last(anyelement);
ALTER EXTENSION "first-last-agg" ADD AGGREGATE first(anyelement);
