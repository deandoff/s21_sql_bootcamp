SELECT DISTINCT order_date AS action_date, name AS person_name FROM person_order
JOIN person ON person_order.person_id = person.id
JOIN person_visits ON person_order.person_id = person_visits.person_id
ORDER BY action_date, person_name DESC
