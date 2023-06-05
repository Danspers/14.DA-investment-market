SELECT fund.name AS name_of_fund,
       comp.name AS name_of_company,
       fr.raised_amount AS amount
FROM investment AS invest
JOIN fund ON invest.fund_id = fund.id
JOIN funding_round AS fr ON invest.funding_round_id = fr.id
JOIN company AS comp ON invest.company_id = comp.id
WHERE comp.milestones > 6
  AND EXTRACT('year' FROM fr.funded_at) BETWEEN 2012 AND 2013;