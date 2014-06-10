first-last-agg 0.1.4
====================

Synopsis
--------

    % CREATE EXTENSION first_last_agg;
    CREATE EXTENSION

    % SELECT last(x order by y) FROM (VALUES (1, 3), (2, 1), (3, 2)) AS v(x, y);
     last 
    ------
        1

    % SELECT first(x order by y) FROM (VALUES (1, 3), (2, 1), (3, 2)) AS v(x, y);
     first  
    -------
         2

Description
-----------

This library contains two simple aggregate functions, `first` and
`last`, operating on any element type. They return the first or the
last value of the aggregated group, respectively.

It is useful with aggregates with `order by`, for easily taking one
element from an aggregate group when you don't really care which do
you get and for emulating a similar functionality from Oracle.

Author
------

[Jan Urbański](http://wulczer.org/), based on code from the
[PostgreSQL wiki](http://wiki.postgresql.org/), specifically on the
SQL definitions of
[first and last](http://wiki.postgresql.org/wiki/First/last_%28aggregate%29)
taken from there.
