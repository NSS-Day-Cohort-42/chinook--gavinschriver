SELECT 
i.InvoiceLineId,
i.InvoiceId,
i.UnitPrice,
i.Quantity,
t.Name TrackName,
a.Name ArtistName
FROM InvoiceLine i 
JOIN Track t ON i.TrackId = t.TrackId
JOIN Album al ON al.AlbumId = t.AlbumId
JOIN Artist a ON a.ArtistId = al.ArtistId
ORDER BY i.InvoiceLineId