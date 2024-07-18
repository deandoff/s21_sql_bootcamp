-- session 1

show transaction isolation level;

-- session 2

show transaction isolation level;

-- session 1

begin transaction;

-- session 2

begin transaction;

-- session 1

select rating from pizzeria where name = 'Pizza Hut';

-- session 2

select rating from pizzeria where name = 'Pizza Hut';

-- session 1

update pizzeria set rating = 4 where name = 'Pizza Hut';

-- session 2

update pizzeria set rating = 3.6 where name = 'Pizza Hut';

-- session 1

commit;

--session 2

commit;

-- session 1

select rating from pizzeria where name = 'Pizza Hut';

-- session 2

select rating from pizzeria where name = 'Pizza Hut';