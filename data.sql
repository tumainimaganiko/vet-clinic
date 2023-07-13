/* Populate database with sample data. */
INSERT INTO
    animals (
        name,
        date_of_birth,
        escape_attempts,
        neutered,
        weight_kg
    )
VALUES
    ('Agumon', '2020-02-03', 0, TRUE, 10.23),
    ('Gabumon', '2018-11-15', 2, TRUE, 8),
    ('Pikachu', '2021-01-07', 1, FALSE, 15.04),
    ('Devimon', '2017-05-12', 5, TRUE, 11);

INSERT INTO
    animals (
        name,
        date_of_birth,
        weight_kg,
        neutered,
        escape_attempts
    )
VALUES
    ('Charmander', '2020-02-08', -11, FALSE, 0),
    ('Plantmon', '2021-11-15', -5.7, TRUE, 2),
    ('Squirtle', '1993-04-02', -12.13, FALSE, 3),
    ('Angemon', '2005-06-12', -45, TRUE, 1),
    ('Boarmon', '2005-06-07', 20.4, TRUE, 7),
    ('Blossom', '1998-10-13', 17, TRUE, 3),
    ('Ditto', '2022-05-14', 22, TRUE, 4);

INSERT INTO
    owners (full_name, age)
VALUES
    ('Sam Smith', 34),
    ('Jennifer Orwell', 19),
    ('Bob', 45),
    ('Melody Pond', 77),
    ('Dean Winchester', 14),
    ('Jodie Whittaker', 38);

INSERT INTO
    species (name)
VALUES
    ('Pokemon'),
    ('Digimon');

UPDATE
    animals
SET
    species_id = 'Digimon'
WHERE
    name LIKE '%mon';

UPDATE
    animals
SET
    species_id = 'Pokemon'
WHERE
    species_id IS NULL;

UPDATE
    animals
SET
    owner_id = 'Sam Smith'
WHERE
    name = 'Agumon';

UPDATE
    animals
SET
    owner_id = 'Jennifer Orwell'
WHERE
    name = 'Gabumon'
    OR name = 'Pikachu';

UPDATE
    animals
SET
    owner_id = 'Bob'
WHERE
    name = 'Devimon'
    OR name = 'Plantmon';

UPDATE
    animals
SET
    owner_id = 'Melody Pond'
WHERE
    name = 'Charmander'
    OR name = 'Squirtle'
    OR name = 'Blossom';

UPDATE
    animals
SET
    owner_id = 'Dean Winchester'
WHERE
    name = 'Angemon'
    OR name = 'Boarmon';

INSERT INTO
    vets (name, age, date_of_graduation)
VALUES
    ('William Tatcher', 45, '2000-04-23'),
    ('Maisy Smith', 26, '2019-01-17'),
    ('Stephanie Mendez', 64, '1981-05-04'),
    ('Jack Harkness', 38, '2008-06-08');

INSERT INTO
    specializations (vet_id, species_id)
VALUES
    (1, 1),
    (3, 1),
    (3, 2),
    (4, 2);

INSERT INTO
    visits (animals_id, vets_id, date_of_visit)
VALUES
    (1, 1, '2020-05-24'),
    (1, 3, '2020-07-22'),
    (2, 4, '2021-02-02'),
    (3, 2, '2020-01-05'),
    (3, 2, '2020-03-08'),
    (3, 2, '2020-05-14'),
    (4, 3, '2021-05-14'),
    (5, 4, '2021-02-24'),
    (6, 2, '2019-12-21'),
    (6, 1, '2020-08-10'),
    (6, 2, '2021-04-07'),
    (7, 3, '2019-09-29'),
    (8, 4, '2020-10-03'),
    (8, 4, '2020-11-4'),
    (9, 2, '2019-01-24'),
    (9, 2, '2019-05-15'),
    (9, 2, '2020-02-27'),
    (9, 2, '2020-08-03'),
    (10, 3, '2020-05-24'),
    (10, 1, '2021-01-11');