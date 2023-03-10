-- How can you produce a list of the start times for bookings by members named 'David Farrell'?


-- Subquery:

SELECT
	starttime
FROM
	cd.bookings
WHERE
	memid = (
		SELECT
	  		memid
	  	FROM
	  		cd.members
	  	WHERE
	  		firstname = 'David'
	  		AND
	  		surname = 'Farrell'
	)


-- Explicit Inner Join:

SELECT
	starttime
FROM
	cd.bookings b
	INNER JOIN
	cd.members m ON b.memid = m.memid
WHERE
	m.firstname = 'David'
	AND
	m.surname = 'Farrell'


-- Implicit Inner Join:

SELECT
	b.starttime
FROM
	cd.bookings b,
	cd.members m
WHERE
	m.firstname = 'David'
	AND
	m.surname = 'Farrell'
	AND
	b.memid = m.memid