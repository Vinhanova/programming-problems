-- How can you produce a list of facilities, with each labelled as 'cheap' or 'expensive' depending on if their monthly maintenance cost is more than $100? Return the name and monthly maintenance of the facilities in question.

SELECT
	name,
	CASE
		WHEN monthlymaintenance > 100 THEN 'expensive'
		ELSE 'cheap'
	END AS cost
FROM
	cd.facilities