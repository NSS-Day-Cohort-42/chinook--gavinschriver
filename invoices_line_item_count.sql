-- Same as "line_items_per_invoice"?
SELECT
    i.InvoiceId,
    COUNT(il.InvoiceLineId)
FROM
    Invoice i
JOIN InvoiceLine il on il.InvoiceId = i.InvoiceId
GROUP BY i.InvoiceId