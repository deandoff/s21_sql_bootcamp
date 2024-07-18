select
    person.name,
    count(*) as count_of_visits
from person_visits
inner join person on person_visits.person_id = person.id
group by person.name
having count(*) > 3