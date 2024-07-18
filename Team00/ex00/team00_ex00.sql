CREATE TABLE paths
(
    point1 varchar not null,
    point2 varchar not null,
    cost   int4
);
INSERT INTO paths (point1, point2, cost)
    VALUES
            ('a', 'b', 10), ('a', 'c', 15), ('a', 'd', 20),
            ('b', 'a', 10), ('b', 'c', 35), ('b', 'd', 25),
            ('c', 'a', 15), ('c', 'b', 35), ('c', 'd', 30),
            ('d', 'a', 20), ('d', 'b', 25), ('d', 'c', 30);


WITH RECURSIVE point_1 AS (
    SELECT point1, point2, cost AS total_cost, point1 AS path
    FROM paths WHERE point1 = 'a'

    UNION ALL

    SELECT child.point1, child.point2, parent.total_cost + child.cost, CONCAT(parent.path, ',', child.point1)
    FROM paths AS child
    INNER JOIN point_1 AS parent ON child.point1 = parent.point2
    WHERE path NOT LIKE CONCAT('%', child.point1, '%')
)
SELECT total_cost, CONCAT('{', path, ',', point2, '}') AS tour
FROM point_1 WHERE point2 = 'a' AND LENGTH(path) = 7
    AND total_cost = (
        SELECT MIN(total_cost)
        FROM point_1
        WHERE LENGTH(path) = 7 AND point2 = 'a'
    )
ORDER BY total_cost, tour;
