-- Find all facilities whose name begins with 'Tennis'
-- Retrieve all columns


-- First approach:

SELECT *
  FROM cd.facilities
  WHERE name LIKE 'Tennis%'


-- Extra approach for fun:

SELECT *
  FROM cd.facilities
  WHERE name LIKE 'Tennis Court _'