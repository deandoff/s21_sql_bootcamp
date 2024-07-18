WITH men AS (
    SELECT name, pr.id AS pr_id FROM person pr
    WHERE pr.gender = 'male' AND (pr.address = 'Moscow' OR pr.address = 'Samara')),
    piz AS (
    SELECT person_id, pizza_name, menu.id AS menu_id FROM person_order po
    JOIN menu ON menu.id = po.menu_id),
    pmen AS (
    SELECT pizza_name, name FROM men
    JOIN piz ON piz.person_id = men.pr_id)
SELECT name FROM pmen
WHERE pizza_name = 'mushroom pizza' OR pizza_name = 'pepperoni pizza'
ORDER BY name DESC;