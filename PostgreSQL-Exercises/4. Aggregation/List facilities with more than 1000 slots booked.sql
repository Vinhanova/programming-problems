/*
  Produce a list of facilities with more than 1000 slots booked.
  Produce an output table consisting of facility id and slots, sorted by facility id.
*/

SELECT
  facid,
  SUM(slots) AS "Total Slots"
FROM
  cd.bookings
GROUP BY
  facid
HAVING
  SUM(slots) > 1000
ORDER BY
  facid