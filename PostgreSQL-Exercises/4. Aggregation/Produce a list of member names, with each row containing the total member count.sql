/*
  Produce a list of member names, with each row containing the total member count.
  Order by join date, and include guest members.
*/

SELECT COUNT(*) OVER () AS count, firstname, surname
  FROM cd.members
ORDER BY joindate