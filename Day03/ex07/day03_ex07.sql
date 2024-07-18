INSERT INTO menu
VALUES (
    19,
    (SELECT id FROM pizzeria WHERE name = 'Dominos') ,
    'greek pizza',
    800);