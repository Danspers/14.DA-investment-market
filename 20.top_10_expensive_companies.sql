SELECT buy_comp.name AS name_acquiring_company,
       ac.price_amount,
       sell_comp.name AS name_acquired_company,
       sell_comp.funding_total,
       ROUND(ac.price_amount / sell_comp.funding_total) AS price_to_funding_rate
FROM acquisition AS ac
LEFT JOIN company AS buy_comp ON ac.acquiring_company_id = buy_comp.id
LEFT JOIN company AS sell_comp ON ac.acquired_company_id = sell_comp.id
WHERE ac.price_amount > 0
  AND sell_comp.funding_total > 0
ORDER BY ac.price_amount DESC, name_acquired_company
LIMIT 10;