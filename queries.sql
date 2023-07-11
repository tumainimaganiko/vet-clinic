/*Queries that provide answers to the questions from all projects.*/
SELECT
    *
FROM
    animals
WHERE
    name LIKE '%mon';

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

SELECT
    *
FROM
    animals
WHERE
    neutered = TRUE;

SELECT
    *
FROM
    animals
WHERE
    name != 'Gabumon';

SELECT
    *
FROM
    animals
WHERE
    weight_kg BETWEEN 10.4
    AND 17.3;

-- Beginning a transaction
BEGIN;

UPDATE
    animals
SET
    species = 'unspecified';

-- Verifying that change was made
SELECT
    *
FROM
    animals;

-- Roll Back the change
ROLLBACK;

-- verifying that the species columns went back to the state before the transaction.
SELECT
    *
FROM
    animals;

UPDATE
    animals
SET
    species = 'digimon'
WHERE
    name LIKE '%mon';

UPDATE
    animals
SET
    species = 'pokemon'
WHERE
    species IS NULL;

BEGIN;

-- Deleting all records
DELETE FROM
    animals;

-- rolling back the transaction.
ROLLBACK;