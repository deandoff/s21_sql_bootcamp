WITH ex AS (
    SELECT name FROM person
    WHERE gender = 'female' and age > 25
)
SELECT name FROM ex
ORDER BY name;