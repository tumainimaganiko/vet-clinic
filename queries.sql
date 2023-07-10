/*Queries that provide answers to the questions from all projects.*/
SELECT
    *
from
    animals
WHERE
    name = 'Luna';

SELECT
    name
FROM
    animals
WHERE
    date_of_birth BETWEEN '2016-01-01'
    AND '2019-12-31';

SELECT
    name
FROM
    animals
WHERE
    neutered = TRUE
    AND escape_attempts < 3;

SELECT
    date_of_birth
FROM
    animals
WHERE
    (
        name = 'Agumon'
        OR name = 'Pikachu'
    );

SELECT
    name,
    escape_attempts
FROM
    animals
WHERE
    weight_kg > 10.5;