with cte_visits as
         (select pizzeria.name as name,
                 count(*)      as count,
                 'visit'       as action_type
          from pizzeria
                   inner join person_visits on pizzeria.id = person_visits.pizzeria_id
          group by pizzeria.name
          order by count desc),
     cte_orders as
         (select pizzeria.name as name,
                 count(*)      as count,
                 'order'       as action_type
          from person_order
                   inner join menu on person_order.menu_id = menu.id
                   inner join pizzeria on menu.pizzeria_id = pizzeria.id
          group by pizzeria.name
          order by count desc)

select pizzeria.name,
       coalesce(cte_visits.count + cte_orders.count, 0) as total_count
from pizzeria
full join cte_orders on cte_orders.name = pizzeria.name
full join cte_visits on cte_visits.name = pizzeria.name
order by total_count desc, name;
