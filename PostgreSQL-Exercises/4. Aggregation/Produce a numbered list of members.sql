/*
  Produce a monotonically increasing numbered list of members (including guests), ordered by their date of joining.
  Remember that member IDs are not guaranteed to be sequential.
*/

-- ROW_NUMBER:

SELECT ROW_NUMBER() OVER(ORDER BY joindate), firstname, surname
  FROM cd.members
ORDER BY joindate


-- COUNT:

SELECT COUNT(*) OVER(ORDER BY joindate), firstname, surname
  FROM cd.members
ORDER BY joindate