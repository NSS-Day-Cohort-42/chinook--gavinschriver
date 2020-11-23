SELECT
    MAX(Country_Total) Highest_Country_Total,
    Highest_Spending_Country
FROM ( SELECT 
        BillingCountry Highest_Spending_Country,
        SUM(Total) Country_Total
        FROM Invoice
        GROUP BY BillingCountry);