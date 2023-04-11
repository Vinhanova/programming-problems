-- Output the names of all members, formatted as 'Surname, Firstname'


-- SQL-Standard using concatenation operator:

SELECT surname || ', ' || firstname AS name
  FROM cd.members


-- Second approach:

SELECT CONCAT(surname, ', ', firstname) AS name
  FROM cd.members