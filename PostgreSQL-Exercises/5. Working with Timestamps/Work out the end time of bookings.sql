-- Return a list of the start and end time of the last 10 bookings in the system
-- (ordered by the time at which they end, followed by the time at which they start)


SELECT starttime, starttime + slots * INTERVAL '30 minutes' AS endtime
  FROM cd.bookings
ORDER BY endtime DESC, starttime DESC
LIMIT 10