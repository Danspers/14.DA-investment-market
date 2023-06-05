WITH 
funding_2011 as
   (SELECT country_code AS country, 
           AVG(funding_total) AS avg_invest_2011
    FROM company AS comp
    WHERE EXTRACT('year' from founded_at) = 2011
    GROUP BY country_code),

funding_2012 as
   (SELECT country_code AS country, 
           AVG(funding_total) AS avg_invest_2012
    FROM company AS comp
    WHERE EXTRACT('year' from founded_at) = 2012
    GROUP BY country_code),

funding_2013 as
   (SELECT country_code AS country, 
           AVG(funding_total) AS avg_invest_2013
    FROM company AS comp
    WHERE EXTRACT('year' from founded_at) = 2013
    GROUP BY country_code)

SELECT f11.country,
       f11.avg_invest_2011,
       f12.avg_invest_2012,
       f13.avg_invest_2013 
FROM funding_2011 AS f11
INNER JOIN funding_2012 AS f12 ON f11.country = f12.country
INNER JOIN funding_2013 AS f13 ON f11.country = f13.country
ORDER BY f11.avg_invest_2011 DESC;