CREATE UNIQUE INDEX idx_person_discounts_unique ON person_discounts(person_id, pizzeria_id);

EXPLAIN ANALYSE
SELECT person_id FROM person_discounts;
SET enable_seqscan = OFF;