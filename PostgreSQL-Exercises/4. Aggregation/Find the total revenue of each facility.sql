/*
  Produce a list of facilities along with their total revenue.
  The output table should consist of facility name and revenue, sorted by revenue.
  Remember that there's a different cost for guests and members!
*/

-- Explicit Inner Join:

SELECT
	f.name,
	SUM(b.slots *
    CASE
		  WHEN b.memid = 0 THEN f.guestcost
		  ELSE f.membercost
		END
	  ) AS revenue
FROM
	cd.facilities f
	INNER JOIN
	cd.bookings b ON b.facid = f.facid
GROUP BY
	f.name
ORDER BY
	revenue


-- Implicit Inner Join:

SELECT
	f.name,
	SUM(b.slots *
    CASE
		  WHEN b.memid = 0 THEN f.guestcost
		  ELSE f.membercost
		END
	  ) AS revenue
FROM
	cd.facilities f,
	cd.bookings b
WHERE
	b.facid = f.facid
GROUP BY
	f.name
ORDER BY
	revenue