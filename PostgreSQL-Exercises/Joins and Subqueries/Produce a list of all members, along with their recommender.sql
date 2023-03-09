/*
  How can you output a list of all members, including the individual who recommended them (if any)?
  Ensure that results are ordered by (surname, firstname).
*/

-- Explicit Left Join:

SELECT
	m1.firstname as memfname,
	m1.surname as memsname,
	m2.firstname as recfname,
	m2.surname as recsname
FROM
	cd.members m1
	LEFT OUTER JOIN cd.members m2 ON m1.recommendedby = m2.memid
ORDER BY
	m1.surname, m1.firstname