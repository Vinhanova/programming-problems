/*
  Based on the 3 complete months of data so far, calculate the amount of time each facility will take to repay its cost of ownership.
  Remember to take into account ongoing monthly maintenance.
  Output facility name and payback time in months, order by facility name.
  Don't worry about differences in month lengths, we're only looking for a rough value here!
*/


-- Number of months hard-coded:

SELECT f.name, f.initialoutlay / (
  SUM(
    CASE
      WHEN b.memid = 0 THEN f.guestcost
      ELSE f.membercost
    END * b.slots
  ) / 3 - f.monthlymaintenance
) AS months
  FROM cd.bookings b
  INNER JOIN cd.facilities f ON f.facid = b.facid
  GROUP BY f.name, f.initialoutlay, f.monthlymaintenance
ORDER BY f.name


-- Subquery with number of months hard-coded (more readable version):

SELECT name, initialoutlay / (monthlyrevenue - monthlymaintenance) AS months
  FROM (
    SELECT f.name, f.initialoutlay, f.monthlymaintenance,
      SUM(
        CASE
          WHEN b.memid = 0 THEN f.guestcost
          ELSE f.membercost
        END * b.slots
      ) / 3 AS monthlyrevenue
      FROM cd.bookings b
      INNER JOIN cd.facilities f ON f.facid = b.facid
      GROUP BY f.name, f.initialoutlay, f.monthlymaintenance
  ) AS monthlyrevenuetable
ORDER BY name