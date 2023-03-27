/*
  Produce a list of members (including guests), along with the number of hours they've booked in facilities, rounded to the nearest ten hours.
  Rank them by this rounded figure, producing output of first name, surname, rounded hours, rank.
  Sort by rank, surname, and first name.
*/

SELECT firstname, surname, hours, RANK() OVER(ORDER BY hours DESC) AS rank
	FROM (
	  	SELECT m.firstname, m.surname, ((SUM(b.slots) + 10) / 20) * 10 AS hours
			FROM cd.members m
				INNER JOIN cd.bookings b ON m.memid = b.memid
			GROUP BY m.firstname, m.surname
	  ) AS bookedhours
ORDER BY rank, surname, firstname