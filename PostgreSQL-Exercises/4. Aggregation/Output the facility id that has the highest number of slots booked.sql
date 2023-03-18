/*
  Output the facility id that has the highest number of slots booked.
  For bonus points, try a version without a LIMIT clause.
  This version will probably look messy!
*/


-- Using Limit:

SELECT
	facid,
	SUM(slots) AS "Total Slots"
FROM
	cd.bookings
GROUP BY
	facid
ORDER BY
	"Total Slots" DESC
LIMIT 1


-- Without Limit and CTEs:

SELECT
	facid,
	SUM(slots) AS "Total Slots"
FROM
	cd.bookings
GROUP BY
	facid
HAVING
	SUM(slots) = (
      SELECT
        MAX(sum)
      FROM(
          SELECT
            facid,
            SUM(slots)
          FROM
            cd.bookings
          GROUP BY
            facid
        ) AS sum
	  )


-- Using CTEs (Common Table Expressions):

WITH sum AS (
  	SELECT
		facid,
		SUM(slots) AS "Total Slots"
	FROM
		cd.bookings
	GROUP BY
		facid
  )

SELECT
	facid,
	"Total Slots"
FROM
	sum
WHERE
	"Total Slots" = (
      SELECT
        MAX("Total Slots")
      FROM
        sum
    )