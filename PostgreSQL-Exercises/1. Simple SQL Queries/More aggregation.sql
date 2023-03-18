-- You'd like to get the first and last name of the last member(s) who signed up - not just the date. How can you do that?

SELECT
  firstname,
  surname,
  joindate
FROM
  cd.members
WHERE
  joindate = (
    SELECT
      MAX(joindate)
    FROM
      cd.members
  )
  