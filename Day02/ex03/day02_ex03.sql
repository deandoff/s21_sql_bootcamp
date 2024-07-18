WITH vd_r AS (
    SELECT visit_date FROM person_visits, generate_series(
        '2022-01-01'::timestamp, '2022-01-10'::timestamp, '1 day'::interval)
    WHERE (person_id = 1 OR person_id = 2)
    ),
    vd_l AS (
    SELECT visit_date FROM person_visits, generate_series(
        '2022-01-01'::timestamp, '2022-01-10'::timestamp, '1 day'::interval)
    )
SELECT DISTINCT vd_l.visit_date AS missing_date
FROM vd_l LEFT JOIN vd_r ON vd_r.visit_date = vd_l.visit_date
WHERE vd_r.visit_date IS NULL
ORDER BY vd_l.visit_date;