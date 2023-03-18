/*
  Produce a list of the total number of slots booked per facility per month in the year of 2012.
  Produce an output table consisting of facility id and slots, sorted by the id and month.
*/

-- First Approach:

SELECT
  facid,
  EXTRACT(month FROM starttime) AS month,
  SUM(slots) AS "Total Slots"
FROM
  cd.bookings
WHERE
  starttime >= '2012/01/01 00:00:00'
  AND
  starttime < '2013/01/01 00:00:00'
GROUP BY
  facid,
  month
ORDER BY
  facid,
  month


-- Second Approach:

SELECT
  facid,
  EXTRACT(month FROM starttime) AS month,
  SUM(slots) AS "Total Slots"
FROM
  cd.bookings
WHERE
  EXTRACT(year FROM starttime) = 2012
GROUP BY
  facid,
  month
ORDER BY
  facid,
  month