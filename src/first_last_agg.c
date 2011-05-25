/*------------------------------------------------------------------------
 *
 * first-last-agg.c
 *     first() and last() aggregate functions working on anyelement
 *
 * Copyright (c) 2011, PostgreSQL Global Development Group
 *
 *-------------------------------------------------------------------------
 */
#include "postgres.h"

#include "fmgr.h"

PG_MODULE_MAGIC;

extern Datum first_sfunc(PG_FUNCTION_ARGS);
extern Datum last_sfunc(PG_FUNCTION_ARGS);


PG_FUNCTION_INFO_V1(first_sfunc);

Datum
first_sfunc(PG_FUNCTION_ARGS)
{
	Datum	element;

	/* if it's NULL, return NULL */
	if (PG_ARGISNULL(0))
		PG_RETURN_NULL();

	/* otherwise simply return the first argument */
	element = PG_GETARG_DATUM(0);
	PG_RETURN_DATUM(element);
}


PG_FUNCTION_INFO_V1(last_sfunc);

Datum
last_sfunc(PG_FUNCTION_ARGS)
{
	Datum	element;

	/* if it's NULL, return NULL */
	if (PG_ARGISNULL(1))
		PG_RETURN_NULL();

	/* otherwise simply return the second argument */
	element = PG_GETARG_DATUM(1);
	PG_RETURN_DATUM(element);
}
