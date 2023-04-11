-- Perform a case-insensitive search to find all facilities whose name begins with 'tennis'
-- Retrieve all columns


-- ILIKE:

SELECT *
  FROM cd.facilities
  WHERE name ILIKE 'tennis%'


-- UPPER:

SELECT *
  FROM cd.facilities
  WHERE UPPER(name) LIKE 'TENNIS%'


-- Using index:

CREATE INDEX idx_facility_name_upper ON cd.facilities (UPPER(name));

SELECT *
  FROM cd.facilities
  WHERE UPPER(name) LIKE 'TENNIS%';