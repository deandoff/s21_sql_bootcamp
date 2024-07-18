with cte_visits as
         (select pizzeria.name as name,
                 count(*)      as count,
                 'visit'       as action_type
          from pizzeria
                   inner join person_visits on pizzeria.id = person_visits.pizzeria_id
          group by pizzeria.name
          order by count desc
          limit 3),
     cte_orders as
         (select pizzeria.name as name,
                 count(*)      as count,
                 'order'       as action_type
          from person_order
                   inner join menu on person_order.menu_id = menu.id
                   inner join pizzeria on menu.pizzeria_id = pizzeria.id
          group by pizzeria.name
          order by count desc
          limit 3)
(select * from cte_orders)
union
(select * from cte_visits)
order by action_type, count desc