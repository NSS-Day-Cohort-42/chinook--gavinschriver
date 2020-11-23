SELECT 
    e.FirstName,
    e.LastName,
    COUNT(i.InvoiceId)
FROM Employee e
LEFT JOIN Customer c ON c.SupportRepId = e.EmployeeId
JOIN Invoice i ON i.CustomerId = c.CustomerId
WHERE e.Title LIKE "%Sales%" AND e.Title LIKE "%Agent%"
GROUP BY e.EmployeeId;