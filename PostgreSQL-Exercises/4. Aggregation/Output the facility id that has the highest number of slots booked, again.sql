/*
  Output the facility id that has the highest number of slots booked.
  Ensure that in the event of a tie, all tieing results get output.
*/


-- First approach:

SELECT facid, total FROM (
      SELECT facid, SUM(slots) total, RANK() OVER(ORDER BY SUM(slots) DESC) rank
        FROM cd.bookings
        GROUP BY facid
    ) AS bookings
  WHERE rank = 1


-- Second approach (recommended, more semantic):

SELECT facid, total FROM (
      SELECT facid, total, RANK() OVER(ORDER BY total DESC) rank FROM (
        SELECT facid, SUM(slots) total
          FROM cd.bookings
          GROUP BY facid
      ) AS sum
    ) AS rankedsum
  WHERE rank = 1