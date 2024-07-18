create function fnc_fibonacci(pstop integer default 10) returns table (fibonacci integer) as $$
declare
    a integer := 0;
    b integer := 1;
    temp integer;
begin
    fibonacci := a;
    return next;
    fibonacci := b;
    return next;
    loop
        temp := a + b;
        a := b;
        b := temp;
        if b >= pstop then
            exit ;
        end if;
        fibonacci := b;
        return next ;
    end loop;
end;
$$ language plpgsql;

select * from fnc_fibonacci(100);
select * from fnc_fibonacci();
