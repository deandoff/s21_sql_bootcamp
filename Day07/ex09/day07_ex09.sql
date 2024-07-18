select
    address,
    round((max(age) - (min(age) *1.0 / max(age))),2) as formula,
    round(avg(age), 2) AS average,
    (SELECT
         CASE
             WHEN (max(age) - (min(age) / max(age))) > avg(age)
                 THEN
                     true
                 ELSE
                    false
             END) AS comparison
from person
group by address
order by address;