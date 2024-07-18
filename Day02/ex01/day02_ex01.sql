SELECT DISTINCT vd_l.visit_date AS missing_date
FROM (
    SELECT visit_date FROM person_visits
    WHERE (visit_date BETWEEN '2022-01-01' AND '2022-01-10')
) AS vd_l
LEFT JOIN (
    SELECT visit_date FROM person_visits
    WHERE (visit_date BETWEEN '2022-01-01' AND '2022-01-10')
    AND (person_id = 1 OR person_id = 2)
    ) AS vd_r
ON vd_r.visit_date = vd_l.visit_date
WHERE vd_r.visit_date IS NULL
ORDER BY missing_date;