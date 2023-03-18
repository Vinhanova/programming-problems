/*
  How can you produce a list of bookings on the day of 2012-09-14 which will cost the member (or guest) more than $30?
  Remember that guests have different costs to members (the listed costs are per half-hour 'slot'), and the guest user is always ID 0.
  Include in your output the name of the facility, the name of the member formatted as a single column, and the cost.
  Order by descending cost, and do not use any subqueries.
*/


-- One Case:

SELECT
  m.firstname || ' ' || m.surname AS member,
  f.name AS facility,
  CASE
    WHEN b.memid = 0 THEN b.slots * f.guestcost
    ELSE b.slots * f.membercost
  END AS cost
FROM
  cd.members m,
  cd.bookings b,
  cd.facilities f
WHERE
  m.memid = b.memid
  AND
  b.facid = f.facid
  AND
  b.starttime >= '2012-09-14'
  AND
  b.starttime < '2012-09-15'
  AND (
    (b.memid = 0 AND b.slots * f.guestcost > 30)
    OR	
    b.slots * f.membercost > 30
  )
ORDER BY
  cost DESC


-- Double Case:

SELECT
  m.firstname || ' ' || m.surname AS member,
  f.name AS facility,
  CASE
    WHEN b.memid = 0 THEN b.slots * f.guestcost
    ELSE b.slots * f.membercost
  END AS cost
FROM
  cd.members m,
  cd.bookings b,
  cd.facilities f
WHERE
  m.memid = b.memid
  AND
  b.facid = f.facid
  AND
  b.starttime >= '2012-09-14'
  AND
  b.starttime < '2012-09-15'
  AND
  CASE
    WHEN b.memid = 0 THEN b.slots * f.guestcost
    ELSE b.slots * f.membercost
  END > 30
ORDER BY
  cost DESC