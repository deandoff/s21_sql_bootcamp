WITH ex AS (
    SELECT pr.name AS p_name, pz.name AS pizzeria_name, pizza_name FROM person_order po
    JOIN person pr ON pr.id = po.person_id
    JOIN menu ON menu.id = po.menu_id
    JOIN pizzeria pz ON pz.id = menu.pizzeria_id
)
SELECT pizza_name, pizzeria_name FROM ex WHERE(
    p_name = 'Denis' OR p_name = 'Anna'
)
ORDER BY pizza_name, pizzeria_name;