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

DELETE FROM
    animals
WHERE
    date_of_birth > 'Jan 1, 2022';

SAVEPOINT SP1;

UPDATE
    animals
SET
    weight_kg = weight_kg * -1;

ROLLBACK TO SP1;

UPDATE
    animals
SET
    weight_kg = weight_kg * -1
WHERE
    weight_kg < 0;

COMMIT;

SELECT
    COUNT(*)
FROM
    animals;

SELECT
    COUNT(*)
FROM
    animals
WHERE
    escape_attempts = 0;

SELECT
    AVG(weight_kg)
FROM
    animals;

SELECT
    MAX(escape_attempts),
    neutered
FROM
    animals
GROUP BY
    neutered;

SELECT
    MIN(weight_kg)
FROM
    animals;

SELECT
    MAX(weight_kg)
FROM
    animals;

SELECT
    AVG(escape_attempts)
FROM
    animals
WHERE
    date_of_birth BETWEEN 'Jan 01,1990'
    AND 'Dec 31,2000';

SELECT
    name
FROM
    animals
    INNER JOIN owners ON animals.owner_id = owners.full_name
WHERE
    animals.owner_id = 'Melody Pond';

SELECT
    animals.name
FROM
    animals
    INNER JOIN species ON animals.species_id = species.name
WHERE
    animals.species_id = 'Pokemon';

SELECT
    full_name,
    name
FROM
    animals
    RIGHT JOIN owners ON animals.owner_id = owners.full_name;

SELECT
    animals.name
FROM
    animals
    JOIN owners ON animals.owner_id = owners.full_name
WHERE
    animals.species_id = 'Digimon'
    AND owners.full_name = 'Jennifer Orwell';

SELECT
    animals.name
FROM
    animals
    JOIN owners ON animals.owner_id = owners.full_name
WHERE
    animals.escape_attempts = 0
    AND owners.full_name = 'Dean Winchester';

SELECT
    full_name
FROM
    animals
    JOIN owners ON animals.owner_id = owners.full_name
GROUP BY
    full_name
ORDER BY
    COUNT(animals.owner_id) DESC
LIMIT
    1;

SELECT
    animals.species_id,
    COUNT(animals.species_id) AS animals
FROM
    animals
    JOIN species ON animals.species_id = species.name
GROUP BY
    animals.species_id;

SELECT
    a.name
FROM
    animals a
    JOIN visits v ON a.id = v.animals_id
    JOIN vets ON vets.id = v.vets_id
WHERE
    vets.name = 'William Tatcher'
GROUP BY
    a.name
ORDER BY
    MAX(v.date_of_visit) DESC
LIMIT
    1;

SELECT
    a.name
FROM
    animals a
    JOIN visits v ON a.id = v.animals_id
    JOIN vets ON vets.id = v.vets_id
WHERE
    vets.name = 'Stephanie Mendez'
GROUP BY
    a.name;

SELECT
    v.name,
    s.name AS specialties
FROM
    vets v
    RIGHT JOIN specializations s ON v.id = s.id
    RIGHT JOIN species ON species.name = s.name;

SELECT
    a.name
FROM
    animals a
    JOIN visits v ON a.id = v.animals_id
    JOIN vets ON vets.id = v.vets_id
WHERE
    v.date_of_visit BETWEEN 'Apr 1, 2020'
    AND 'Aug 30, 2020'
    AND vets.name = 'Stephanie Mendez';

SELECT
    a.name,
    COUNT(*)
FROM
    animals a
    JOIN visits v ON a.id = v.animals_id
    JOIN vets ON vets.id = v.vets_id
GROUP BY
    a.name
ORDER BY
    COUNT(*) DESC
LIMIT
    1;

SELECT
    a.name
FROM
    animals a
    JOIN visits v ON a.id = v.animals_id
    JOIN vets ON vets.id = v.vets_id
WHERE
    vets.name = 'Maisy Smith'
GROUP BY
    a.name
ORDER BY
    MIN(v.date_of_visit)
LIMIT
    1;

SELECT
    a.name AS animal_name,
    a.date_of_birth,
    a.escape_attempts,
    a.neutered,
    a.weight_kg,
    a.species_id,
    a.owner_id,
    ve.name AS vet_name,
    ve.age,
    date_of_graduation,
    v.date_of_visit
FROM
    animals a
    JOIN visits v ON a.id = v.animals_id
    JOIN vets ve ON ve.id = v.vets_id
WHERE
    v.date_of_visit = (
        SELECT
            date_of_visit
        FROM
            visits
        ORDER BY
            date_of_visit DESC
        LIMIT
            1
    );

SELECT
    COUNT(*) AS misfit_visits_count
FROM
    vets
    LEFT JOIN specializations s ON vets.id = s.id
    JOIN visits v ON vets.id = v.vets_id
    JOIN animals a ON a.id = v.animals_id
WHERE
    s.id IS NULL
    OR (
        s.name != a.species_id
        AND s.id != (
            SELECT
                s.id
            FROM
                specializations s
            GROUP BY
                s.id
            HAVING
                COUNT(s.id) = (
                    SELECT
                        MAX(count_id)
                    FROM
                        (
                            SELECT
                                COUNT(s.id) AS count_id
                            FROM
                                specializations s
                            GROUP BY
                                s.id
                        ) AS count_ids
                )
        )
    );