SELECT comp.name,
       COUNT(DISTINCT ed.instituition)
FROM people AS p
JOIN education AS ed ON p.id = ed.person_id
JOIN company AS comp ON p.company_id = comp.id
GROUP BY comp.name
ORDER BY COUNT(ed.instituition) DESC
LIMIT 5;