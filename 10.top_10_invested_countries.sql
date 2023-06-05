SELECT f.country_code,
       MIN(f.invested_companies) AS min_invested_companies,
       MAX(f.invested_companies) AS max_invested_companies,
       AVG(f.invested_companies) AS avg_invested_companies
FROM fund f
INNER JOIN investment i ON f.id = i.fund_id
INNER JOIN company c ON i.company_id = c.id
WHERE EXTRACT('year' FROM f.founded_at) BETWEEN 2010 AND 2012
GROUP BY f.country_code
HAVING MIN(f.invested_companies) > 0
ORDER BY avg_invested_companies DESC, f.country_code ASC
LIMIT 10;