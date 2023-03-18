/*
  How can you output a list of all members who have recommended another member?
  Ensure that there are no duplicates in the list, and that results are ordered by (surname, firstname).
*/


-- Subquery:

SELECT
  firstname,
  surname
FROM
  cd.members
WHERE
  memid IN (
    SELECT
        recommendedby
      FROM
        cd.members
  )
ORDER BY
  surname, firstname


-- Explicit Self Join:

SELECT DISTINCT
  m2.firstname as firstname,
  m2.surname as surname
FROM
  cd.members m1
  INNER JOIN
  cd.members m2 ON m1.recommendedby = m2.memid
ORDER BY
  surname, firstname


-- Implicit Self Join:

SELECT DISTINCT
  m2.firstname as firstname,
  m2.surname as surname
FROM
  cd.members m1,
  cd.members m2
WHERE
  m1.recommendedby = m2.memid
ORDER BY
  surname, firstname