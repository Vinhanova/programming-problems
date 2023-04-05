-- Produce a timestamp for 1 a.m. on the 31st of August 2012


-- Best way to create a timestamp under normal circumstances:

SELECT TIMESTAMP '2012-08-31 01:00:00'

-- OR:

SELECT TIMESTAMP '2012-08-31 01:00:00' AS timestamp


-- Postgres extension:

SELECT '2012-08-31 01:00:00'::TIMESTAMP AS timestamp


-- SQL-Standard:

SELECT CAST('2012-08-31 01:00:00' AS TIMESTAMP) AS timestamp