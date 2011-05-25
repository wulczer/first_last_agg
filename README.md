first_last_agg
--------------

A simple extension providing two aggregate functions, `last` and `first`
aggregate functions, operating on any element type and returning the last or
the first value of the group.

Since by default the ordering inside groups created by a `GROUP BY` expression
is not defined, it is advisable to use an `ORDER BY` clause inside the
aggregate expression (see the [aggregate function syntax](http://www.postgresql.org/docs/current/static/sql-expressions.html#SYNTAX-AGGREGATES))
"")).
This feature has been added in PostgreSQL 9.0.

This extension is intended to replace the corresponding
[first](http://wiki.postgresql.org/wiki/Last_%28aggregate%29) and
[last](http://wiki.postgresql.org/wiki/First_%28aggregate%29) aggregates from
the PostgreSQL wiki.
