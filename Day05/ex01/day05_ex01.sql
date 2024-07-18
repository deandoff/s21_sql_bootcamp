EXPLAIN ANALYSE
SELECT menu.pizza_name, pizzeria.name
FROM menu JOIN pizzeria on pizzeria.id = menu.pizzeria_id;
SET enable_seqscan = OFF;