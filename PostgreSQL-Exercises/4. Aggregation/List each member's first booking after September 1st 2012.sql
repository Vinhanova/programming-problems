/*
  Produce a list of each member name, id, and their first booking after September 1st 2012.
  Order by member ID.
*/


SELECT m.surname, m.firstname, m.memid, MIN(b.starttime) AS starttime
  FROM cd.members m
     INNER JOIN cd.bookings b ON m.memid = b.memid
  WHERE b.starttime >= '2012-09-01 00:00:00'
  GROUP BY m.surname, m.firstname, m.memid
ORDER BY m.memid

/*
  Tip:
  You might typically use a query like this to find a customer's next booking.
  You can use this by replacing the date '2012-09-01' with the function now()
*/