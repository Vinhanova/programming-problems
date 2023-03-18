/*
  How can you output a list of all members, including the individual who recommended them (if any), without using any joins?
  Ensure that there are no duplicates in the list, and that each firstname + surname pairing is formatted as a column and ordered.
*/


-- Correlated Subquery:

SELECT DISTINCT
  m1.firstname || ' ' || m1.surname as member,
  ( SELECT
      m2.firstname || ' ' || m2.surname
    FROM
      cd.members m2
    WHERE
      m1.recommendedby = m2.memid
  ) AS recommender
FROM
  cd.members m1
ORDER BY
  member ASC