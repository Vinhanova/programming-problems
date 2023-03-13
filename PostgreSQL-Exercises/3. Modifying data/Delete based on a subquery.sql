/*
  In our previous exercises, we deleted a specific member who had never made a booking.
  How can we make that more general, to delete all members who have never made a booking?
*/

-- Subquery:

DELETE FROM
	cd.members
WHERE
	memid NOT IN (
	  	SELECT DISTINCT
	  		memid
	  	FROM
	  		cd.bookings
	  )

-- Correlated Subquery:

DELETE FROM
	cd.members m
WHERE
	NOT EXISTS (
	  	SELECT
	  		1
	  	FROM
	  		cd.bookings
	  	WHERE
	  		memid = m.memid
	  )

-- OR

DELETE FROM
	cd.members m
WHERE
	NOT EXISTS (
	  	SELECT
	  		*
	  	FROM
	  		cd.bookings
	  	WHERE
	  		memid = m.memid
      LIMIT
        1
	  )