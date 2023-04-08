-- For each month of the year in 2012, output the number of days in that month
-- Format the output as an integer column containing the month of the year, and a second column containing an interval data type


-- First approach:

SELECT EXTRACT(MONTH FROM date) AS month, (date + INTERVAL '1 month') - date AS length
  FROM (
    SELECT CONCAT('2012-', GENERATE_SERIES(1, 12, 1), '-01 00:00:00')::TIMESTAMP AS date
  ) AS everydate


-- Second approach:

SELECT EXTRACT(MONTH FROM date) AS month, (date + INTERVAL '1 month') - date AS length
  FROM (
    SELECT GENERATE_SERIES(TIMESTAMP '2012-01-01', TIMESTAMP '2012-12-01', '1 month') AS date
  ) AS everydate