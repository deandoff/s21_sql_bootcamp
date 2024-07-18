CREATE VIEW v_price_with_discount AS
SELECT
    p.name,
    m.pizza_name,
    m.price,
    m.price * 0.9 as discount_price
FROM person_order po
JOIN person p ON po.person_id = p.id
JOIN menu m on m.id = po.menu_id
ORDER BY 1, 2