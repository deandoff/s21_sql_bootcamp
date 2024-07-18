WITH
    pr AS (
    SELECT DISTINCT GREATEST(pr1.id, pr2.id) AS person1_id,
        LEAST(pr1.id, pr2.id) AS person2_id, pr1.address AS common_address
    FROM person pr1
    JOIN person pr2 ON pr2.address = pr1.address
    WHERE pr1.name != pr2.name
    ORDER BY 1, 2 DESC
)
SELECT pr1.name AS person_name1, pr2.name AS person_name2, common_address FROM pr
JOIN person pr1 ON pr1.id = person1_id
JOIN person pr2 ON pr2.id = person2_id;