SELECT 
p.Name, 
p.PlaylistId,
COUNT(pt.TrackId) TrackCount
FROM Playlist p
LEFT JOIN PlaylistTrack pt ON  pt.PlaylistId = p.PlaylistId
GROUP BY p.PlaylistId