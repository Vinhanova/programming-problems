-- Find the upward recommendation chain for member ID 27: that is, the member who recommended them, and the member who recommended that member, and so on
-- Return member ID, first name, and surname
-- Order by descending member id

-- Example:

WITH RECURSIVE NAME(columns) as (
  <initial statement>
  UNION ALL 
  <recursive statement>
)


-- First approach:

WITH RECURSIVE recommended_tree AS (
    SELECT memid, recommendedby, firstname, surname
      FROM cd.members
      WHERE memid = 27
    UNION ALL
    SELECT m.memid, m.recommendedby, m.firstname, m.surname
      FROM cd.members m
      INNER JOIN recommended_tree rt ON m.memid = rt.recommendedby
  )


SELECT memid AS recommender, firstname, surname
  FROM recommended_tree
  WHERE memid != 27