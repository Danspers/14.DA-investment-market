SELECT comp.name,
       EXTRACT('month' from fr.funded_at)
FROM company AS comp
JOIN funding_round AS fr ON fr.company_id = comp.id
WHERE comp.category_code = 'social'
  AND fr.raised_amount <> 0
  AND EXTRACT('year' from fr.funded_at) BETWEEN 2010 AND 2013;