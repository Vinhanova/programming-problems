/*
  We made a mistake when entering the data for the second tennis court.
  The initial outlay was 10000 rather than 8000: you need to alter the data to fix the error.
*/

UPDATE
	cd.facilities
SET
	initialoutlay = 10000
WHERE
	name LIKE 'Tennis Court 2'