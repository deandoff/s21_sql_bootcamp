WITH ex AS (
    SELECT pizzeria_id, pizza_name, price FROM menu
    WHERE pizza_name = 'mushroom pizza' OR pizza_name = 'pepperoni pizza'
)
SELECT pizza_name, pizzeria.name AS pizzeria_name, price
FROM ex JOIN pizzeria ON pizzeria.id = ex.pizzeria_id
ORDER BY pizza_name, pizzeria_name;