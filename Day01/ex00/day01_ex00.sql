SELECT id as object_id, name as object_name FROM person
UNION
SELECT id, pizza_name FROM menu
ORDER BY object_id, object_name