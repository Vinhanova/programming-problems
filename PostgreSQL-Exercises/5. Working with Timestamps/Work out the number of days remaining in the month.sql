/*
  For any given timestamp, work out the number of days remaining in the month
  The current day should count as a whole day, regardless of the time
  Use '2012-02-11 01:00:00' as an example timestamp for the purposes of making the answer
  Format the output as a single interval value
*/


-- First approach:

SELECT CONCAT(EXTRACT(YEAR FROM date), '-', EXTRACT(MONTH FROM date), '-01')::TIMESTAMP + INTERVAL '1 month' - date AS remaining
  FROM (
    SELECT DATE_TRUNC('day', '2012-02-11 01:00:00'::TIMESTAMP) AS date
  ) dateinfo


-- Second approach:

SELECT (
  DATE_TRUNC('month', date) + INTERVAL '1 month'
) - date AS remaining
  FROM (
    SELECT DATE_TRUNC('day', '2012-02-11 01:00:00'::TIMESTAMP) AS date
  ) dateinfo