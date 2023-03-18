-- How can you produce a list of all facilities with the word 'Tennis' in their name?

SELECT
  *
FROM
  cd.facilities
WHERE
  name LIKE '%Tennis%'