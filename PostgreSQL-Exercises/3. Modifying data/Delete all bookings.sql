/*
  As part of a clearout of our database, we want to delete all bookings from the cd.bookings table.
  How can we accomplish this?
*/

DELETE FROM
	cd.bookings


-- OR TRUNCATE
-- "TRUNCATE also deletes everything in the table, but does so using a quicker underlying mechanism. It's not perfectly safe in all circumstances, though, so use judiciously. When in doubt, use DELETE."

TRUNCATE
  cd.bookings