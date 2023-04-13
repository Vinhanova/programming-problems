-- The telephone numbers in the database are very inconsistently formatted
-- You'd like to print a list of member ids and numbers that have had '-','(',')', and ' ' characters removed
-- Order by member id


-- REGEXP_REPLACE:

SELECT memid, REGEXP_REPLACE(telephone, '[^0-9]', '', 'g') AS telephone
  FROM cd.members
ORDER BY memid

SELECT memid, REGEXP_REPLACE(telephone, '\D', '', 'g') AS telephone
  FROM cd.members
ORDER BY memid


-- TRANSLATE:

SELECT memid, TRANSLATE(telephone, '-() ', '') AS telephone
  FROM cd.members
ORDER BY memid