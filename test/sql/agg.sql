BEGIN;
SET client_min_messages TO 'WARNING';
\set ECHO 0
\i sql/first_last_agg.sql
\set ECHO all
RESET client_min_messages;

CREATE TEMPORARY TABLE agg_test (
    akey integer,
    val1 integer,
    val2 integer
);

INSERT INTO agg_test (akey, val1, val2)
VALUES (1, 2, 1), (1, 4, 2), (1, 3, 3),
       (2, 1, 4), (2, 5, 3), (2, NULL, 2), (2, 2, 1),
       (3, NULL, NULL),
       (4, 3, 1), (4, 5, NULL), (4, 7, 2),
       (5, 5, 1), (5, 5, 2), (5, 5, 3);

SELECT akey, first(val1 ORDER BY val2) AS first, last(val1 ORDER BY val2) AS last FROM agg_test GROUP BY akey ORDER BY akey;
SELECT akey, first(val1 ORDER BY val2 NULLS LAST) AS first, last(val1 ORDER BY val2 NULLS LAST) AS last FROM agg_test GROUP BY akey ORDER BY akey;
SELECT akey, first(val1 ORDER BY val2 ASC) AS first, last(val1 ORDER BY val2 DESC) AS last FROM agg_test GROUP BY akey ORDER BY akey;
SELECT akey, first(val1 ORDER BY val2 ASC NULLS FIRST) AS first, last(val1 ORDER BY val2 NULLS FIRST) AS last FROM agg_test GROUP BY akey ORDER BY akey;
SELECT akey, first(val1) AS first, last(val1) AS last FROM agg_test WHERE akey IN (3, 5) GROUP BY akey ORDER BY akey;
SELECT akey, first(val1) AS first, last(val1) AS last FROM agg_test WHERE akey = 100;

ROLLBACK;
