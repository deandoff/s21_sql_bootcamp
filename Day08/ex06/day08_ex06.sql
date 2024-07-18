-- session 1

begin transaction isolation level repeatable read;

-- session 2

begin transaction isolation level repeatable read;

-- session 1

select sum(rating) from pizzeria;

-- session 2

insert into pizzeria (id, name, rating) values (11, 'Kazan Pizza 2', 4);
commit;

-- session 1

select sum(rating) from pizzeria;
commit;
select sum(rating) from pizzeria;

-- session 2

select sum(rating) from pizzeria;