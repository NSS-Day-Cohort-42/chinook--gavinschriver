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
