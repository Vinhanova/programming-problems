/*
  Produce a list of the total number of hours booked per facility, remembering that a slot lasts half an hour.
  The output table should consist of the facility id, name, and hours booked, sorted by facility id.
  Try formatting the hours to two decimal places.
*/


SELECT f.facid, f.name,
  TRIM(TO_CHAR(SUM(b.slots) / 2.0, '99999999999.99')) AS "Total Hours" -- OR --> '99999999999D99'
  FROM cd.bookings b
     INNER JOIN cd.facilities f ON f.facid = b.facid
  GROUP BY f.facid
ORDER BY f.facid, f.name