create function fnc_trg_person_delete_audit() returns trigger as $$
    begin
    insert into person_audit (type_event, row_id, name, age, gender, address)
    values ('D', old.id, old.name, old.age, old.gender, old.address);
    return null;
    end;
$$ language plpgsql;

create trigger trg_person_delete_audit after delete on person for each row execute function fnc_trg_person_delete_audit();

delete from person where id = 10;

