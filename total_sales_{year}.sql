SELECT 
    SUBSTR(InvoiceDate, 1, 4) AS 'Year', 
    ('$' || SUM(Total)) AS 'Total_Sales' 
FROM Invoice
WHERE InvoiceDate LIKE "%2009%" OR InvoiceDate LIKE "%2011%"
GROUP BY CASE 
    WHEN InvoiceDate LIKE "%2009%" THEN "2009"
    WHEN InvoiceDate LIKE "%2011" THEN "2011"
    ELSE NULL
    END
ORDER BY InvoiceDate;

