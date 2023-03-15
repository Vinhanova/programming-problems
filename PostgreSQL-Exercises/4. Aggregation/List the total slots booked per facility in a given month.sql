/*
  Produce a list of the total number of slots booked per facility in the month of September 2012.
  Produce an output table consisting of facility id and slots, sorted by the number of slots.
*/

SELECT
	facid,
	SUM(slots) AS "Total Slots"
FROM
	cd.bookings
WHERE
	starttime >= '2012/09/01 00:00:00'
	AND
	starttime < '2012/10/01 00:00:00'
GROUP BY
	facid
ORDER BY
	"Total Slots"