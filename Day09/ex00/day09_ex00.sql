create table person_audit (
    created timestamp with time zone default current_timestamp not null,
    type_event char(1) default 'I' not null,
    row_id bigint not null,
    name varchar,
    age integer,
    gender varchar,
    address varchar
);

alter table person_audit add constraint ch_type_event check (type_event in ('I', 'U', 'D'));

create function fnc_trg_person_insert_audit() returns trigger as $$
    begin
    insert into person_audit (type_event, row_id, name, age, gender, address)
    values ('I', new.id, new.name, new.age, new.gender, new.address);
    return null;
    end;
$$ language plpgsql;

create trigger trg_person_insert_audit after insert on person execute function fnc_trg_person_insert_audit();

insert into person(id, name, age, gender, address) values (10, 'Damir', 22, 'male', 'Irkutsk');
