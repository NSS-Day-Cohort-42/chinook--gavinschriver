SELECT 
    Track_id,
    Track_name,
    MAX(Track_Purchase_Total) Track_purchases
FROM 
    (SELECT
        SUM(il.Quantity) Track_Purchase_Total,
        t.Name Track_name,
        il.TrackId Track_id
    FROM InvoiceLine il
    JOIN Track t ON t.TrackId = il.TrackId
    JOIN Invoice i ON i.InvoiceId = il.InvoiceId
    WHERE i.InvoiceDate LIKE "%2013%"
    GROUP BY Track_name
    )

