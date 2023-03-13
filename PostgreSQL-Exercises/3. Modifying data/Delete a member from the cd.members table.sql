/*
  We want to remove member 37, who has never made a booking, from our database.
  How can we achieve that?
*/

DELETE FROM
	cd.members
WHERE
	memid = 37