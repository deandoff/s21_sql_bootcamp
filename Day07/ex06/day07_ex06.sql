select
    pizzeria.name,
    count(*) as count_of_orders,
    round(avg(menu.price), 2) as average_price,
    max(menu.price) as max_price,
    min(menu.price) as min_price
from person_order
inner join menu on person_order.menu_id = menu.id
inner join pizzeria on menu.pizzeria_id = pizzeria.id
group by pizzeria.name
order by pizzeria.name;