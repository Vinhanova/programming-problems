/*
  For each day in August 2012, calculate a rolling average of total revenue over the previous 15 days.
  Output should contain date and revenue columns, sorted by the date.
  Remember to account for the possibility of a day having zero revenue.
  This one's a bit tough, so don't be afraid to check out the hint!
*/


-- First approach using Window function:

SELECT date, revenue
  FROM(
    SELECT date, AVG(sumrevenue) OVER (
      ORDER BY date
      ROWS 14 PRECEDING -- OR --> RANGE BETWEEN '14 days' PRECEDING AND CURRENT ROW
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
  ) AS avgrevenue
  WHERE date >= '2012-08-01'
ORDER BY date


-- Correlated subquery:

SELECT 	dategen.date, (
  -- Correlated subquery that, for each day fed into it, finds the average revenue for the last 15 days
  SELECT SUM(
    CASE
      WHEN memid = 0 THEN slots * f.guestcost
      ELSE slots * membercost
    END
  ) AS rev
    FROM cd.bookings b
    INNER JOIN cd.facilities f ON b.facid = f.facid
    WHERE b.starttime > dategen.date - interval '14 days'
      AND b.starttime < dategen.date + interval '1 day'
) / 15 AS revenue
  FROM (
    -- Generates a list of days in august
    SELECT CAST(
        GENERATE_SERIES(TIMESTAMP '2012-08-01', '2012-08-31', '1 day') AS date
      ) AS date
  )  AS dategen
ORDER BY dategen.date 


-- Second approach using Window function:

SELECT date, avgrev FROM (
  -- AVG over this row and the 14 rows before it.
  SELECT 	dategen.date AS date, AVG(revdata.rev) OVER(
    ORDER BY dategen.date ROWS 14 PRECEDING
  ) AS avgrev
    FROM (
      -- Generate a list of days – This ensures that a row gets generated even if the day has 0 revenue
      -- Note that we generate days before the start of october – This is because our window function needs
      -- to know the revenue for those days for its calculations
      SELECT CAST(
        GENERATE_SERIES(TIMESTAMP '2012-07-10', '2012-08-31', '1 day') AS date
      ) AS date
    )  AS dategen
      LEFT OUTER JOIN (
        -- Left join to a table of per-day revenue
        SELECT CAST(b.starttime AS date) AS date, SUM(
          CASE
            WHEN memid = 0 THEN slots * f.guestcost
            ELSE slots * membercost
          END
        ) AS rev
          FROM cd.bookings b
          INNER JOIN cd.facilities f ON b.facid = f.facid
          GROUP BY CAST(b.starttime AS date)
      ) AS revdata ON dategen.date = revdata.date
) AS avgrevenue
  WHERE date >= '2012-08-01'
ORDER BY date


--  View:
--  A view is essentially a stored query that looks exactly like a table.
--  Under the covers, the DBMS just subsititutes in the relevant portion of the view definition when you select data from it. (if we ever go back and edit our data, we need to remember to recalculate)

CREATE OR REPLACE VIEW cd.dailyrevenue AS
  SELECT CAST(b.starttime AS date) AS date, SUM(
    CASE
      WHEN memid = 0 THEN slots * f.guestcost
      ELSE slots * membercost
    END
  ) AS rev
    FROM cd.bookings b
    INNER JOIN cd.facilities f ON b.facid = f.facid
    GROUP BY CAST(b.starttime AS date);


SELECT date, avgrev
  FROM (
    SELECT dategen.date AS date, AVG(revdata.rev) OVER(
      ORDER BY dategen.date ROWS 14 PRECEDING
    ) AS avgrev
      FROM (
        SELECT CAST(
          GENERATE_SERIES(TIMESTAMP '2012-07-10', '2012-08-31', '1 day') AS date
        ) AS date
      ) AS dategen
      LEFT OUTER JOIN cd.dailyrevenue AS revdata ON dategen.date = revdata.date
  ) AS avgrevenue
  WHERE date >= '2012-08-01'
ORDER BY date;