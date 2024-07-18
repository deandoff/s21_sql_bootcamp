SELECT
    (SELECT name
     FROM person
     WHERE id = person_order.person_id) AS NAME
FROM person_order
WHERE (menu_id = 13 or menu_id = 14 or menu_id = 18) and order_date = '2022-01-07'