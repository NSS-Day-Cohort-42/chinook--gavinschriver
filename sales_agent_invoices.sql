SELECT 
i.Total, 
i.InvoiceId, 
i.CustomerId, 
i.InvoiceDate, 
i.BillingAddress,
i.BillingCity,
i.BillingCountry,
i.BillingPostalCode,
e.FirstName, 
e.LastName
FROM Invoice i
INNER JOIN Customer c ON c.CustomerId = i.CustomerId
INNER JOIN Employee e ON e.EmployeeId = c.SupportRepId;