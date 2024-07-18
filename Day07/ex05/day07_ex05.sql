select distinct
    person.name
from person_order
inner join person on person_order.person_id = person.id
order by person.name;