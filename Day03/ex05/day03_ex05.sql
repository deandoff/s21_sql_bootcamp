WITH pizzerias_visited_by_andrey AS (
    SELECT DISTINCT p.name AS pizzeria_name
    FROM pizzeria p
    JOIN person_visits pv ON p.id = pv.pizzeria_id
    JOIN person per ON pv.person_id = per.id
    WHERE per.name = 'Andrey'
),

pizzerias_ordered_by_andrey AS (
    SELECT DISTINCT p.name AS pizzeria_name
    FROM pizzeria p
    JOIN menu m ON p.id = m.pizzeria_id
    JOIN person_order po ON m.id = po.menu_id
    JOIN person per ON po.person_id = per.id
    WHERE per.name = 'Andrey'
)

SELECT pva.pizzeria_name
FROM pizzerias_visited_by_andrey pva
LEFT JOIN pizzerias_ordered_by_andrey poa ON pva.pizzeria_name = poa.pizzeria_name
WHERE poa.pizzeria_name IS NULL
ORDER BY pva.pizzeria_name