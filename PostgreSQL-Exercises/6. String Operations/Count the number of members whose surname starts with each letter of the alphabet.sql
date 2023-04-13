-- You'd like to produce a count of how many members you have whose surname starts with each letter of the alphabet
-- Sort by the letter, and don't worry about printing out a letter if the count is 0


-- SUBSTRING (allows the use of Regex):

SELECT SUBSTRING(surname FROM 1 FOR 1) AS letter, COUNT(*) AS count
	FROM cd.members
	GROUP BY letter
ORDER BY letter


SELECT SUBSTRING(surname FOR 1) AS letter, COUNT(*) AS count
	FROM cd.members
	GROUP BY letter
ORDER BY letter


SELECT SUBSTRING(surname, 1, 1) AS letter, COUNT(*) AS count
	FROM cd.members
	GROUP BY letter
ORDER BY letter


-- SUBSTR:

SELECT SUBSTR(surname, 1, 1) AS letter, COUNT(*) AS count
	FROM cd.members
	GROUP BY letter
ORDER BY letter


-- LEFT:

SELECT LEFT(surname, 1) AS letter, COUNT(*) AS count
	FROM cd.members
	GROUP BY letter
ORDER BY letter