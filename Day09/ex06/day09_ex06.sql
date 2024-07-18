create function fnc_person_visits_and_eats_on_date(pperson varchar = 'Dmitriy', pprice int = 500, pdate date = '2022-01-08') returns table (
    pizzeria_name varchar
) as $$ (
    select distinct pizzeria.name from person_visits
    join person on person_visits.person_id = person.id
    join pizzeria on person_visits.pizzeria_id = pizzeria.id
    join menu on pizzeria.id = menu.pizzeria_id
    where person.name = pperson and person_visits.visit_date = pdate and menu.price < pprice
) $$ language sql;

select * from fnc_person_visits_and_eats_on_date(pprice := 800);

select * from fnc_person_visits_and_eats_on_date(pperson := 'Anna',pprice := 1300,pdate := '2022-01-01');
