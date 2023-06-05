SELECT SUM(price_amount)
FROM acquisition
WHERE term_code  = 'cash'
  AND EXTRACT('year' FROM acquired_at) BETWEEN 2011 AND 2013;