-- How can you produce a list of facilities that charge a fee to members?

SELECT
  *
FROM
  cd.facilities
WHERE
  membercost > 0