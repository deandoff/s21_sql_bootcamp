WITH nearest_date AS (
  SELECT user_id, money, currency_id,
    COALESCE(
      (SELECT MAX(updated) FROM currency WHERE id = b.currency_id AND updated < b.updated),
      (SELECT MIN(updated) FROM currency WHERE id = b.currency_id AND updated > b.updated)
    ) AS updated
  FROM balance b
)
SELECT
  COALESCE(u.name, 'not defined') AS name,
  COALESCE(u.lastname, 'not defined') AS lastname,
  c.name AS currency_name,
  date.money * c.rate_to_usd AS currency_in_usd
FROM
    nearest_date date
    JOIN currency c ON (date.updated = c.updated AND date.currency_id = c.id)
    LEFT JOIN public."user" u ON date.user_id = u.id
ORDER BY 1 DESC, 2, 3;