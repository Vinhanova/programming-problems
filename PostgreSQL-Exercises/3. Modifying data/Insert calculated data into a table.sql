/*
  Let's try adding the spa to the facilities table again.
  This time, though, we want to automatically generate the value for the next facid, rather than specifying it as a constant.
  
  Use the following values for everything else:
    Name: 'Spa', membercost: 20, guestcost: 30, initialoutlay: 100000, monthlymaintenance: 800.
*/


-- INSERT INTO ... SELECT (recommended):

INSERT INTO
	cd.facilities (facid, name, membercost, guestcost, initialoutlay, monthlymaintenance)
SELECT (
		SELECT
			MAX(facid) + 1
		FROM
			cd.facilities
	),'Spa', 20, 30, 100000, 800


-- INSERT INTO ... VALUES (should be used to insert only constant data):

INSERT INTO
	cd.facilities (facid, name, membercost, guestcost, initialoutlay, monthlymaintenance)
VALUES ((
		SELECT
			MAX(facid) + 1
		FROM
			cd.facilities
	),'Spa', 20, 30, 100000, 800)