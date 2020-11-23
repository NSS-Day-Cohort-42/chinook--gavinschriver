-- Same as "invoice_line_item_count"?
SELECT
    i.InvoiceId,
    COUNT(il.InvoiceLineId)
FROM
    Invoice i
JOIN InvoiceLine il on il.InvoiceId = i.InvoiceId
GROUP BY i.InvoiceId