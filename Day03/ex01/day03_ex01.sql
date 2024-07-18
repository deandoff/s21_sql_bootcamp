select menu.id as menu_id from menu
where not exists (
    select 1 
    from person_order
    where person_order.menu_id = menu.id)
order by menu_id