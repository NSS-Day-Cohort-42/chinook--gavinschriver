SELECT 
    t.Name TrackName,
    mt.Name MediaType,
    g.Name Genre
FROM Track t
LEFT JOIN MediaType mt ON mt.MediaTypeId = t.MediaTypeId
LEFT JOIN Genre g ON g.GenreId = t.GenreId