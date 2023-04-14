-- Find the upward recommendation chain for member ID 27: that is, the member who recommended them, and the member who recommended that member, and so on
-- Return member ID, first name, and surname
-- Order by descending member id


-- First try (still needs corrections):

WITH RECURSIVE recommended_tree (memid, recommendedby, firstname, surname) AS (
  	SELECT memid, recommendedby, firstname, surname
  		FROM cd.members
  		WHERE memid = 27
  	UNION ALL
  	SELECT m.memid, m.recommendedby, m.firstname, m.surname
  		FROM cd.members m
  		INNER JOIN recommended_tree ON m.memid = recommended_tree.recommendedby
  )


SELECT memid, recommendedby AS recommender, firstname, surname
	FROM recommended_tree