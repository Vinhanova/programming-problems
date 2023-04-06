-- Work out the number of seconds between the timestamps '2012-08-31 01:00:00' and '2012-09-02 00:00:00'

-- PostgreSQL:

SELECT EXTRACT(EPOCH FROM TIMESTAMP '2012-09-02 00:00:00' - TIMESTAMP '2012-08-31 01:00:00')


-- SQL-Standard:

SELECT EXTRACT(DAY FROM ts.int) * 60 * 60 * 24 +
  EXTRACT(HOUR FROM ts.int) * 60 * 60 +
  EXTRACT(MINUTE FROM ts.int) * 60 +
  EXTRACT(SECOND FROM ts.int)
  FROM (
    SELECT TIMESTAMP '2012-09-02 00:00:00' - '2012-08-31 01:00:00' AS INT
  ) ts