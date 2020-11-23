SELECT i.Total, c.FirstName, c.LastName, c.Country, e.FirstName Employee_FirstName, e.LastName Employee_LastName FROM Invoice i 
LEFT JOIN Customer c ON c.CustomerId = i.CustomerId
LEFT JOIN Employee e ON e.EmployeeId = c.SupportRepId;