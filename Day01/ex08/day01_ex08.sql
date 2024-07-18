SELECT order_date, (name || ' (age:' || age || ')') as person_information
FROM person_order
NATURAL JOIN (SELECT person.id AS person_id, name, age FROM person) as pina
ORDER BY order_date, person_information