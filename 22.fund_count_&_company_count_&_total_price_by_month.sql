WITH
fund_count_monthly AS
   (SELECT EXTRACT('month' from fr.funded_at) AS month,
           COUNT(DISTINCT invest.fund_id) AS fund_count
    FROM funding_round AS fr
    INNER JOIN investment AS invest ON fr.id = invest.funding_round_id
    WHERE EXTRACT('year' from fr.funded_at) BETWEEN 2010 AND 2013
      AND invest.fund_id IN (SELECT id
                             FROM fund
                             WHERE country_code = 'USA')
    GROUP BY month),

acquired_company_monthly AS
   (SELECT EXTRACT('month' from acquired_at) AS month,
           COUNT(acquired_company_id) AS company_count,
           SUM(price_amount) AS total_price
    FROM acquisition
    WHERE EXTRACT('year' from acquired_at) BETWEEN 2010 AND 2013
    GROUP BY month)
    
SELECT fcm.month,
       fcm.fund_count,
       acm.company_count,
       acm.total_price
FROM fund_count_monthly AS fcm
JOIN acquired_company_monthly AS acm ON fcm.month = acm.month;