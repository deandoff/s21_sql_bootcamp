SELECT DISTINCT p.name AS pizzeria_name
FROM pizzeria p
JOIN menu m ON p.id = m.pizzeria_id
JOIN person_order po ON m.id = po.menu_id
JOIN person per ON po.person_id = per.id
GROUP BY p.name
HAVING SUM(CASE WHEN per.gender = 'male' THEN 1 ELSE 0 END) = 0
UNION
SELECT DISTINCT p.name AS pizzeria_name
FROM pizzeria p
JOIN menu m ON p.id = m.pizzeria_id
JOIN person_order po ON m.id = po.menu_id
JOIN person per ON po.person_id = per.id
GROUP BY p.name
HAVING SUM(CASE WHEN per.gender = 'female' THEN 1 ELSE 0 END) = 0
ORDER BY pizzeria_name