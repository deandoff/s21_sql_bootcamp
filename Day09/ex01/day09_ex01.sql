create or replace function fnc_trg_person_update_audit() returns trigger as $$
    begin
    insert into person_audit (type_event, row_id, name, age, gender, address)
    values ('U', old.id, old.name, old.age, old.gender, old.address);
    return null;
    end;
$$ language plpgsql;

create trigger trg_person_update_audit after update on person for each row execute function fnc_trg_person_update_audit();

update person set name = 'Bulat' where id = 10;
update person set name = 'Damir' where id = 10;



