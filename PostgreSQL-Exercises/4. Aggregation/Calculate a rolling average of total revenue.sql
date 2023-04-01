/*
  For each day in August 2012, calculate a rolling average of total revenue over the previous 15 days.
  Output should contain date and revenue columns, sorted by the date.
  Remember to account for the possibility of a day having zero revenue.
  This one's a bit tough, so don't be afraid to check out the hint!
*/


-- First approach:

SELECT date, revenue
	FROM(
	  SELECT date, AVG(sumrevenue) OVER (
      ORDER BY date
      RANGE BETWEEN '14 days' PRECEDING AND CURRENT ROW
    ) AS revenue
    FROM(
      SELECT DATE(starttime), SUM(
        CASE
          WHEN b.memid = 0 THEN f.guestcost
          ELSE f.membercost
        END * b.slots
      ) AS sumrevenue
        FROM cd.bookings b
        INNER JOIN cd.facilities f ON b.facid = f.facid
        WHERE b.starttime >= DATE('2012-08-01') - INTERVAL '14 days'
          AND b.starttime < '2012-09-01'
        GROUP BY date
    ) AS totalrevenue
    GROUP BY date, sumrevenue
  ) AS qwe
  WHERE date >= '2012-08-01'
    AND date < '2012-09-01'
ORDER BY date


/* SELECT date, sumrevenue AS revenue
	FROM(
	  SELECT DATE(starttime), SUM(
        CASE
          WHEN b.memid = 0 THEN f.guestcost
          ELSE f.membercost
        END * b.slots
      ) AS sumrevenue
      FROM cd.bookings b
      INNER JOIN cd.facilities f ON b.facid = f.facid
      WHERE b.starttime >= DATE('2012-08-01') - INTERVAL '15 days'
          AND b.starttime < '2012-09-01'
      GROUP BY date
	) AS totalrevenue
ORDER BY date */