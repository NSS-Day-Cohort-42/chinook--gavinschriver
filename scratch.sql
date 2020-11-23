
-- incorrect first attempt at PL track count; if we only InnerJoin, any Playlists that don't appear
-- as FK in the PlaylistTrack table won't be listed; Need to be sure to LEFT/RIGHT join starting from any table 
-- for which you need all the rows, no matter if they have correspodning JOIN rows or not
--So, correct move is to FROM (table where you need all rows) LEFT JOIN
--(Other table on key match), then we can GROUP BY the unique idenitfier col of the 
--table for which we need every row

SELECT 
    p.Name PlaylistName,
    p.PlaylistId,
    COUNT(*) TrackCount
FROM PlaylistTrack pt
JOIN Playlist p ON p.PlayListId =  pt.PlaylistId
GROUP BY p.PlaylistId;


-- this is most specific version of this; even tho we get the same results
-- without specifying LEFT, this would ensure that we see even Agents who had no customer, or (by left-joining to invoices)
-- did have customers, but none of whom had any associated invoices aka sales agent about to get fired 
SELECT 
    e.FirstName,
    e.LastName,
    COUNT(i.InvoiceId)
FROM Employee e
LEFT JOIN Customer c ON c.SupportRepId = e.EmployeeId
LEFT JOIN Invoice i ON i.CustomerId = c.CustomerId
WHERE e.Title LIKE "%Sales%" AND e.Title LIKE "%Agent%"
GROUP BY e.EmployeeId;

--Think theyre all the same for this year?
SELECT 
    e.FirstName, 
    e.LastName, 
    MAX(i.Total) HighestSalesTotal
FROM Employee e 
LEFT JOIN Customer c ON c.SupportRepId = e.EmployeeId
LEFT JOIN Invoice i ON i.CustomerId = c.CustomerId
WHERE i.InvoiceDate LIKE "%2009%";

--Per-customerId invoice Total $$$ Sums
SELECT 
SUM(i.Total) as Customer_Totals,
i.CustomerId
FROM Invoice i
GROUP BY i.CustomerId;


--Per Employee sales totals
SELECT
MAX(Customer_Total) Total_Sales,
FirstName,
LastName
FROM
    (SELECT
    SUM(i.Total) Customer_Total,
    e.FirstName FirstName,
    e.LastName LastName
    FROM Invoice i
    JOIN Customer c ON c.CustomerId = i.CustomerId
    JOIN Employee e ON e.EmployeeId = c.SupportRepId
    GROUP BY e.EmployeeId)


