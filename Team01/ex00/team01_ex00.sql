WITH max_usd_rate AS (
    SELECT currency.id, currency.name AS currency_name, currency.rate_to_usd, currency.updated AS max_date
    FROM currency
    JOIN (SELECT id, MAX(updated) AS max_date FROM currency GROUP BY id) AS temp ON temp.max_date = currency.updated AND temp.id = currency.id
)
SELECT DISTINCT
    COALESCE(u.name, 'not defined') AS name,
    COALESCE(u.lastname, 'not defined') AS lastname,
    type,
    sum(b.money) as volume,
    COALESCE(max_usd_rate.currency_name, 'not defined') as currency_name,
    COALESCE(max_usd_rate.rate_to_usd, 1) AS last_rate_to_usd,
    SUM(money) * COALESCE(max_usd_rate.rate_to_usd, 1)  AS total_volume_in_usd
FROM
    balance b
    FULL JOIN public."user" u ON b.user_id = u.id
    FULL JOIN max_usd_rate ON b.currency_id = max_usd_rate.id
GROUP BY u.name, u.lastname, b.type, currency_name, max_usd_rate.rate_to_usd
ORDER BY 1 desc, 2, 3;