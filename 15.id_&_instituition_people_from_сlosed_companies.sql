SELECT DISTINCT p.id,
       ed.instituition
FROM people AS p
INNER JOIN education AS ed ON p.id = ed.person_id
WHERE company_id IN (SELECT id
                     FROM company
                     WHERE status = 'closed'
                           AND id IN (SELECT company_id
                                      FROM funding_round
                                      WHERE is_first_round = 1
                                        AND is_last_round = 1));