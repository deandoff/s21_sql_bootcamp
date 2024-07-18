-- session 1

begin transaction;

-- session 2

begin transaction;

-- session 1

update pizzeria set rating = 1 where id = 1;

-- session 2

update pizzeria set rating = 2 where id = 2;

-- session 1

update pizzeria set rating = 2.2 where id = 2;

-- session 2

update pizzeria set rating = 3 where id = 1;

-- session 1

commit;

-- session 2

commit;

-- session 1

select * from pizzeria;

-- session 2

select * from pizzeria;