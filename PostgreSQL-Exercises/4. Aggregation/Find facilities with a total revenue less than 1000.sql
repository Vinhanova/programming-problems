/*
  Produce a list of facilities with a total revenue less than 1000.
  Produce an output table consisting of facility name and revenue, sorted by revenue.
  Remember that there's a different cost for guests and members!
*/


-- Using Where (way better and simpler):

SELECT
  name,
  revenue
FROM (
    SELECT
      f.name,
      SUM(b.slots *
        CASE
          WHEN b.memid = 0 THEN f.guestcost
          ELSE f.membercost
        END
      ) AS revenue
    FROM
      cd.bookings b
      INNER JOIN
      cd.facilities f ON b.facid = f.facid
    GROUP BY
      f.name
  ) AS fac
WHERE
  revenue < 1000
ORDER BY
  revenue


-- Using Having:

SELECT
  name,
  revenue
FROM (
    SELECT
      f.name,
      SUM(b.slots *
        CASE
          WHEN b.memid = 0 THEN f.guestcost
          ELSE f.membercost
        END
      ) AS revenue
    FROM
      cd.bookings b
      INNER JOIN
      cd.facilities f ON b.facid = f.facid
    GROUP BY
      f.name
  ) AS fac
GROUP BY
  name,
  revenue
HAVING
  revenue < 1000
ORDER BY
  revenue