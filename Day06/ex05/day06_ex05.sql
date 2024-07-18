COMMENT ON TABLE person_discounts IS 'Таблица для учета скидок в разных пиццериях';
COMMENT ON COLUMN person_discounts.id IS 'Уникальный id-номер таблицы';
COMMENT ON COLUMN person_discounts.person_id IS 'id человека, соответсвующий записи таблицы person';
COMMENT ON COLUMN person_discounts.pizzeria_id IS 'id пиццерии, соответсвующий записи таблицы pizzeria';
COMMENT ON COLUMN person_discounts.discount IS 'Величина скидки (от 0 до 100) в процентах';