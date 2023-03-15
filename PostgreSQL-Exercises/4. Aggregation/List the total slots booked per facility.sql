/*
  Produce a list of the total number of slots booked per facility.
  For now, just produce an output table consisting of facility id and slots, sorted by facility id.
*/

SELECT
	facid,
	SUM(slots) AS "Total Slots"
FROM
	cd.bookings
GROUP BY
	facid
ORDER BY
	facid