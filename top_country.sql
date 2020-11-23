SELECT 
    MAX(Contry_Purchase_Total) Highest_Country_Total,
    Country_name
FROM (
    SELECT 
        SUM(i.Total) Contry_Purchase_Total,
        i.BillingCountry Country_name
        FROM Invoice i
        GROUP BY i.BillingCountry 
)