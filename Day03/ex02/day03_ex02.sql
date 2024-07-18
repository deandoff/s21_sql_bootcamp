select menu.pizza_name, menu.price, pizzeria.name
from menu
join pizzeria ON menu.pizzeria_id = pizzeria.id
where not exists (
    select 1 
    from person_order
    where person_order.menu_id = menu.id)
order by pizza_name, price