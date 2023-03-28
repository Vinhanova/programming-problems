/*
  Produce a list of the top three revenue generating facilities (including ties).
  Output facility name and rank, sorted by rank and facility name.
*/


-- First approach:

SELECT name, RANK() OVER(ORDER BY revenue DESC) AS rank
  FROM (
    SELECT f.name, 
      SUM(
        CASE
          WHEN b.memid = 0 THEN b.slots * f.guestcost
          ELSE b.slots * f.membercost
        END
      ) AS revenue
    FROM cd.facilities f
    INNER JOIN cd.bookings b ON f.facid = b.facid
    GROUP BY f.name
  ) AS totalrevenue
ORDER BY rank, name
LIMIT 3


-- Second Approach:

SELECT f.name, RANK() OVER(
  ORDER BY SUM(
    CASE
      WHEN b.memid = 0 THEN b.slots * f.guestcost
      ELSE b.slots * f.membercost
    END
  ) DESC
) AS rank
  FROM cd.facilities f
  INNER JOIN cd.bookings b ON f.facid = b.facid
  GROUP BY f.name
ORDER BY rank, name
LIMIT 3