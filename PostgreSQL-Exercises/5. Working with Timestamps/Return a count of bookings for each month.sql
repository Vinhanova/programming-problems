-- Return a count of bookings for each month, sorted by month

SELECT DATE_TRUNC('month', starttime) AS month, COUNT(*) AS count
	FROM cd.bookings
	GROUP BY month
ORDER BY month