/*
  Classify facilities into equally sized groups of high, average, and low based on their revenue.
  Order by classification and facility name.
*/

-- First approach:

SELECT name,
	CASE
		WHEN bucket = 1 THEN 'high'
		WHEN bucket = 2 THEN 'average'
		ELSE 'low'
	END AS revenue
	FROM (
    SELECT f.name, NTILE(3) OVER(
      ORDER BY SUM(
        CASE
          WHEN b.memid = 0 THEN b.slots * f.guestcost
          ELSE b.slots * f.membercost
        END
      ) DESC
    ) AS bucket
      FROM cd.bookings b
      INNER JOIN cd.facilities f ON b.facid = f.facid
      GROUP BY f.name
    ORDER BY bucket, name
	) AS totalrevenue


-- Second approach (step by step):

SELECT name,
	CASE
		WHEN bucket = 1 THEN 'high'
		WHEN bucket = 2 THEN 'average'
		ELSE 'low'
	END AS revenue
	FROM (
    SELECT name, NTILE(3) OVER(ORDER BY revenue DESC) AS bucket
      FROM (
          SELECT f.name, SUM(
            CASE
              WHEN b.memid = 0 THEN b.slots * f.guestcost
              ELSE b.slots * f.membercost
            END
          ) AS revenue
          FROM cd.bookings b
          INNER JOIN cd.facilities f ON b.facid = f.facid
          GROUP BY f.name
      ) AS revenue_buckets
    ORDER BY bucket, name
	) AS revenue


/*
For fun but could not test:

CREATE TABLE string_buckets (
  bucket_number integer,
  bucket_range text
);

INSERT INTO string_buckets (bucket_number, bucket_range)
VALUES (1, 'high'), (2, 'average'), (3, 'low');

SELECT tr.name, sb.bucket_range
	FROM (
	  	SELECT f.name, NTILE(3) OVER(ORDER BY SUM(
			CASE
				WHEN b.memid = 0 THEN b.slots * f.guestcost
				ELSE b.slots * f.membercost
			END
		  ) DESC) AS bucket_number
			FROM cd.bookings b
				 INNER JOIN cd.facilities f ON b.facid = f.facid
			GROUP BY f.name
	  ) AS totalrevenue tr
	INNER JOIN string_buckets sb ON tr.bucket_number = sb.bucket_number;
*/