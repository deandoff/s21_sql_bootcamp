select pizzeria.name from pizzeria
left join person_visits pv on pizzeria.id = pv.pizzeria_id
left join person on pv.person_id = person.id
where pv.pizzeria_id is not null
group by pizzeria.name
having (count(case when person.gender = 'male' then 1 end) != count(case when person.gender = 'female' then 1 end))
order by pizzeria.name