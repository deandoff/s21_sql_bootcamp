WITH pzm AS (
    SELECT pz.id AS pz_id, price, pz.name AS pizzeria_name FROM pizzeria pz
    JOIN menu on menu.pizzeria_id = pz.id ),
    pvp AS (
    SELECT pizzeria_id, pr.name AS pr_name, visit_date FROM person_visits pv
    JOIN person pr ON pr.id = pv.person_id),
    pvz AS (
    SELECT pizzeria_name, visit_date, pr_name, price FROM pvp JOIN pzm ON pzm.pz_id = pvp.pizzeria_id)
SELECT pizzeria_name FROM pvz
WHERE pr_name = 'Dmitriy' AND visit_date = '2022-01-08' AND price < 800