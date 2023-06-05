WITH people_instituition AS (
    SELECT p.id,
           COUNT(ed.instituition) AS count_instituition
    FROM people AS p
    INNER JOIN education AS ed ON p.id = ed.person_id
    WHERE company_id IN (SELECT id
                         FROM company
                         WHERE name = 'Facebook')
GROUP BY p.id)

SELECT AVG(count_instituition)
FROM people_instituition;