/*
  How can you produce a list of the start times for bookings for tennis courts, for the date '2012-09-21'?
  Return a list of start time and facility name pairings, ordered by the time.
*/


-- Implicit Inner Join:

SELECT
  b.starttime AS start,
  f.name
FROM
  cd.bookings b,
  cd.facilities f
WHERE
  b.facid = f.facid
  AND
  f.name LIKE 'Tennis Court%' -- OR --> f.name IN ('Tennis Court 1','Tennis Court 2')
  AND
  b.starttime >= '2012-09-21'
  AND
  b.starttime < '2012-09-22'
ORDER BY
  b.starttime ASC


-- Explicit Inner Join:

SELECT
  b.starttime AS start,
  f.name
FROM
  cd.bookings b
  INNER JOIN
  cd.facilities f ON b.facid = f.facid
WHERE
  f.name IN ('Tennis Court 1','Tennis Court 2')
  AND
  b.starttime >= '2012-09-21'
  AND
  b.starttime < '2012-09-22'
ORDER BY
  b.starttime ASC
