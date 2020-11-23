SELECT
MAX(Customer_Totals) Total_Sales,
FirstName,
LastName
FROM
    (SELECT
    SUM(i.Total) Customer_Totals,
    e.FirstName FirstName,
    e.LastName LastName
    FROM Invoice i
    JOIN Customer c ON c.CustomerId = i.CustomerId
    JOIN Employee e ON e.EmployeeId = c.SupportRepId
    WHERE i.InvoiceDate LIKE "%2009%"
    GROUP BY e.EmployeeId)
