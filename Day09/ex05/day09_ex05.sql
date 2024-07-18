create function fnc_persons (pgender varchar='female') returns table (
    id bigint,
    name varchar,
    age integer,
    gender varchar,
    address varchar
) as $$ (select * from person p where pgender = p.gender);
$$ language sql;

select * from fnc_persons(pgender := 'male');

select * from fnc_persons();

