SELECT
 COUNT(*) Purchase_count,
 t.Name Track_name
FROM InvoiceLine i
JOIN Track t ON t.TrackId = i.TrackId
GROUP BY t.Name
ORDER BY Purchase_count DESC
LIMIT 5