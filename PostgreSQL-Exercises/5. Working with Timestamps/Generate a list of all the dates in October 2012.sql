-- Produce a list of all the dates in October 2012
-- They can be output as a timestamp (with time set to midnight) or a date


SELECT GENERATE_SERIES(TIMESTAMP '2012-10-01 00:00:00', TIMESTAMP '2012-10-31 00:00:00', '1 day') AS ts

-- OR:

SELECT GENERATE_SERIES(TIMESTAMP '2012-10-01 00:00:00', TIMESTAMP '2012-10-31 00:00:00', INTERVAL '1 day') AS ts