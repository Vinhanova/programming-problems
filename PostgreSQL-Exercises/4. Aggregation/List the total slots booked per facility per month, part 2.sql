/*
  Produce a list of the total number of slots booked per facility per month in the year of 2012.
  In this version, include output rows containing totals for all months per facility, and a total for all months for all facilities. The output table should consist of facility id, month and slots, sorted by the id and month.
  When calculating the aggregated values for all months and all facids, return null values in the month and facid columns.
*/

SELECT facid, EXTRACT(month FROM starttime) AS month, SUM(slots)
  FROM cd.bookings
  WHERE
    starttime >= '01/01/2012 00:00:00'
    AND starttime < '01/01/2013 00:00:00'
  GROUP BY ROLLUP (facid, month)
ORDER BY facid, month


-- UNION:

SELECT facid, EXTRACT(MONTH FROM starttime) AS MONTH, SUM(slots) AS slots
  FROM cd.bookings
  WHERE
    starttime >= '2012-01-01 00:00:00'
    AND starttime < '2013-01-01 00:00:00'
  GROUP BY facid, MONTH
UNION ALL
SELECT facid, NULL, SUM(slots) AS slots
  FROM cd.bookings
  WHERE
    starttime >= '2012-01-01 00:00:00'
    AND starttime < '2013-01-01 00:00:00'
  GROUP BY facid
UNION ALL
SELECT NULL, NULL, SUM(slots) AS slots
  FROM cd.bookings
  WHERE
    starttime >= '2012-01-01 00:00:00'
    AND starttime < '2013-01-01 00:00:00'
ORDER BY facid, MONTH


-- UNION & CTE:

WITH bookings AS (
	SELECT facid, EXTRACT(MONTH FROM starttime) AS MONTH, slots
	FROM cd.bookings
	WHERE
		starttime >= '2012-01-01'
		AND starttime < '2013-01-01'
)
SELECT facid, MONTH, SUM(slots) FROM bookings GROUP BY facid, MONTH
UNION ALL
SELECT facid, NULL, SUM(slots) FROM bookings GROUP BY facid
UNION ALL
SELECT NULL, NULL, SUM(slots) FROM bookings
ORDER BY facid, MONTH;