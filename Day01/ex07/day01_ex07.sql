SELECT order_date, (name || ' (age:' || age || ')') as person_information
FROM person_order
JOIN person on person_order.person_id = person.id
ORDER BY order_date, person_information