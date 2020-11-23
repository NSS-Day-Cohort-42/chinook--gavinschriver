SELECT
    SUM(Quantity) Artist_Track_Purchases,
    '$' || ROUND(SUM(il.UnitPrice), 2) Artist_purchase_total,
    a.Name Artist_name
FROM
    Artist a
JOIN Album al ON al.ArtistId = a.ArtistId
JOIN Track t ON t.AlbumId = al.Albumid
JOIN InvoiceLine il ON il.TrackId = t.TrackId
GROUP BY a.Name
ORDER BY Artist_Track_Purchases DESC
LIMIT 3;
