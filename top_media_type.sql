SELECT
    MAX(Media_Type_Total) MediaType_Count,
    MediaType_Name
FROM (
    SELECT 
        SUM(il.Quantity) Media_Type_Total,
        mt.Name MediaType_Name
    FROM MediaType mt
    JOIN Track t ON t.MediaTypeId = mt.MediaTypeId
    JOIN InvoiceLine il ON il.TrackId = t.TrackId
    GROUP BY mt.Name 
)