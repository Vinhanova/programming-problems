/*
  Produce a CTE that can return the upward recommendation chain for any member.
  You should be able to select recommender from recommenders where member=x.
  Demonstrate it by getting the chains for members 12 and 22.
  Results table should have member and recommender, ordered by member ascending, recommender descending.
*/


WITH RECURSIVE allrecommenders AS (
  	SELECT memid AS member, recommendedby AS recommender
  		FROM cd.members
  	UNION ALL
  	SELECT ar.member, m.recommendedby
  		FROM allrecommenders ar
  		INNER JOIN cd.members m ON ar.recommender = m.memid
  )

SELECT ar.member, ar.recommender, m.firstname, m.surname
	FROM allrecommenders ar
	INNER JOIN cd.members m ON ar.recommender = m.memid
	WHERE member = 12 OR member = 22
ORDER BY member, recommender DESC