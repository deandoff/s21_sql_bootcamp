create function func_minimum(arr numeric[]) returns numeric AS $$
    declare v_min numeric;
begin
    select MIN(n) into v_min
    from unnest(arr) as t(n);
    return v_min;
end;
$$ language plpgsql;

select func_minimum(variadic arr => array [10.0, -1.0, 5.0, 4.4]);