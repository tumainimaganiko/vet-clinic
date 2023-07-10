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