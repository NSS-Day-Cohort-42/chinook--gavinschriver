SELECT 
    e.FirstName,
    e.LastName,
    COUNT(c.CustomerId) CustomerCount
FROM
    Employee e
JOIN Customer c ON c.SupportRepId = e.EmployeeId
GROUP BY e.EmployeeId