WITH
    pep AS (
    SELECT pr.id AS pr_id, pr.name AS pr_name FROM person_order po
    JOIN menu ON menu.id = po.menu_id
    JOIN person pr ON pr.id = po.person_id
    WHERE pizza_name = 'pepperoni pizza' AND pr.gender = 'female'
    ),
    ches AS (
    SELECT pr.id AS pr_id FROM person_order po
    JOIN menu ON menu.id = po.menu_id
    JOIN person pr ON pr.id = po.person_id
    WHERE pizza_name = 'cheese pizza' AND pr.gender = 'female'
    )
SELECT pr_name AS name FROM pep
JOIN ches ON ches.pr_id = pep.pr_id
ORDER BY name;