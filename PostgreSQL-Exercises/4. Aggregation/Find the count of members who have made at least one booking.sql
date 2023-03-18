--  Find the total number of members (including guests) who have made at least one booking.

SELECT
  COUNT(DISTINCT memid)
FROM
  cd.bookings