select distinct
    person.address,
    pizzeria.name,
    count(*) as count_of_orders
from person_order
inner join menu on person_order.menu_id = menu.id
inner join pizzeria on menu.pizzeria_id = pizzeria.id
inner join person on person_order.person_id = person.id
group by person.address, pizzeria.name
order by person.address, pizzeria.name;
