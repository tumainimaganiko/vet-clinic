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
    ('Charmander', 'Feb 8, 2020', -11, FALSE, 0),
    ('Plantmon', 'Nov 15, 2021', -5.7, TRUE, 2),
    ('Squirtle', 'Apr 2,1993', -12.13, FALSE, 3),
    ('Angemon', 'Jun 12 2005', -45, TRUE, 1),
    ('Boarmon', 'Jun 7, 2005', 20.4, TRUE, 7),
    ('Blossom', 'Oct 13, 1998', 17, TRUE, 3),
    ('Ditto', 'May 14, 2022', 22, TRUE, 4);

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
    ('William Tatcher', 45, 'Apr 23, 2000'),
    ('Maisy Smith', 26, 'Jan 17,2019'),
    ('Stephanie Mendez', 64, 'May 4,1981'),
    ('Jack Harkness', 38, 'Jun 8,2008');

INSERT INTO
    specializations (id, name)
VALUES
    (1, 'Pokemon'),
    (3, 'Digimon'),
    (3, 'Pokemon'),
    (4, 'Digimon');

INSERT INTO
    visits (animals_id, vets_id, date_of_visit)
VALUES
    (1, 1, 'May 24,2020'),
    (1, 3, 'Jul 22,2020'),
    (2, 4, 'Feb 2,2021'),
    (3, 2, 'Jan 5,2020'),
    (3, 2, 'Mar 8,2020'),
    (3, 2, 'May 14,2020'),
    (4, 3, 'May 14,2021'),
    (5, 4, 'Feb 24,2021'),
    (6, 2, 'Dec 21,2019'),
    (6, 1, 'Aug 10,2020'),
    (6, 2, 'Apr 7,2021'),
    (7, 3, 'Sep 29,2019'),
    (8, 4, 'Oct 3,2020'),
    (8, 4, 'Nov 4,2020'),
    (9, 2, 'Jan 24,2019'),
    (9, 2, 'May 15,2019'),
    (9, 2, 'Feb 27,2020'),
    (9, 2, 'Aug 3,2020'),
    (10, 3, 'May 24,2020'),
    (10, 1, 'Jan 11,2021');