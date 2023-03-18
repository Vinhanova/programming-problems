/*
  How can you produce a list of all members who have used a tennis court?
  Include in your output the name of the court, and the name of the member formatted as a single column.
  Ensure no duplicate data, and order by the member name followed by the facility name.
*/


-- Concat_ws:

SELECT DISTINCT
  CONCAT_WS(' ', m.firstname, m.surname) AS member, -- OR --> CONCAT(m.firstname, ' ', m.surname) AS member, 
  f.name AS facility
FROM
  cd.members m,
  cd.bookings b,
  cd.facilities f
WHERE
  m.memid = b.memid
  AND
  b.facid = f.facid
  AND
  f.name LIKE 'Tennis%' -- OR --> f.name in ('Tennis Court 2','Tennis Court 1')
ORDER BY
  member, facility


-- String Concatenation Operator:

SELECT DISTINCT
  m.firstname || ' ' || m.surname AS member,
  f.name AS facility
FROM
  cd.members m,
  cd.bookings b,
  cd.facilities f
WHERE
  m.memid = b.memid
  AND
  b.facid = f.facid
  AND
  f.name LIKE 'Tennis%' -- OR --> f.name in ('Tennis Court 2','Tennis Court 1')
ORDER BY
  member, facility