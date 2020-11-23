--RN because of Stringification of Total country sales, sort by descending is out of what. Possibly order first
--in numerical form then select those cols as subquery?
SELECT 
    '$' || ROUND(SUM(i.Total), 2) Total_country_sales,
    i.BillingCountry Country_name
FROM Invoice i
GROUP BY i.BillingCountry
ORDER BY Total_country_sales  DESC
