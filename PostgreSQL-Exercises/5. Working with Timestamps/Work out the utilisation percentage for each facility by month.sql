--  Work out the utilisation percentage for each facility by month, sorted by name and month, rounded to 1 decimal place
--  Opening time is 8am, closing time is 8.30pm
--  You can treat every month as a full month, regardless of if there were some dates the club was not open


-- First approach:

SELECT name, month, ROUND(
    CAST(
      EXTRACT(EPOCH FROM slots * INTERVAL '30 minutes') /
      EXTRACT(EPOCH FROM EXTRACT(DAYS FROM month + INTERVAL '1 month' - month) * INTERVAL '12 hours 30 minutes')
      * 100 AS NUMERIC
    ), 1
  ) AS utilisation
  FROM (
    SELECT f.name AS name, DATE_TRUNC('month', b.starttime) AS month, SUM(b.slots) AS slots
      FROM cd.bookings b
      INNER JOIN cd.facilities f ON f.facid = b.facid
      GROUP BY name, month
  ) AS monthtable
ORDER BY name


-- Second approach:

SELECT name, month,
  ROUND(
    100 * slots /
    CAST(
      25 * (CAST((month + INTERVAL '1 month') AS DATE)
      - CAST (month AS DATE)) AS NUMERIC
    ), 1
  ) AS utilisation
  FROM (
    SELECT f.name AS name, DATE_TRUNC('month', starttime) AS month, SUM(slots) AS slots
      FROM cd.bookings b
      INNER JOIN cd.facilities f ON b.facid = f.facid
      GROUP BY f.facid, month
  ) AS monthtable
ORDER BY name, month