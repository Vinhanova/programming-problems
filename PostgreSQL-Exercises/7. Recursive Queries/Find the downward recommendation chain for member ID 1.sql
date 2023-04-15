-- Find the downward recommendation chain for member ID 1: that is, the members they recommended, the members those members recommended, and so on
-- Return member ID and name, and order by ascending member id


-- Without INNER JOIN:

WITH RECURSIVE recomendation_chain AS (
    SELECT memid, recommendedby, firstname, surname
      FROM cd.members
      WHERE recommendedby = 1 -- Could also start with memid = 1 and remove it in the end but it would add 1 more recursive cycle and unnecessary complexity
    UNION ALL
    SELECT m.memid, m.recommendedby, m.firstname, m.surname
      FROM cd.members m
      INNER JOIN recomendation_chain rc ON rc.memid = m.recommendedby
  )

SELECT memid, firstname, surname
  FROM recomendation_chain
ORDER BY memid


-- With INNER JOIN:

WITH RECURSIVE recomendation_chain AS (
    SELECT memid, recommendedby, firstname, surname
      FROM cd.members
      WHERE recommendedby = 1
    UNION ALL
    SELECT m.memid, m.recommendedby, m.firstname, m.surname
      FROM cd.members m
      INNER JOIN recomendation_chain rc ON rc.memid = m.recommendedby
  )

SELECT rc.memid, rc.firstname, rc.surname
  FROM recomendation_chain rc
  INNER JOIN cd.members m ON m.memid = rc.memid
ORDER BY memid