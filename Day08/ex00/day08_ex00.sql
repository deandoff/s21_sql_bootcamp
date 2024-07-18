-- session 1

begin transaction;
select name, rating from pizzeria where name = 'Pizza Hut';
update pizzeria set rating = 5 where name = 'Pizza Hut';
select name, rating from pizzeria where name = 'Pizza Hut';

-- session 2

select name, rating from pizzeria where name = 'Pizza Hut';

--session 1

commit transaction;

-- session 2

select name, rating from pizzeria where name = 'Pizza Hut';