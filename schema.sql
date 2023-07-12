/* Database schema to keep the structure of entire database. */
CREATE TABLE animals (
    id INT GENERATED BY DEFAULT AS IDENTITY,
    name char(30),
    date_of_birth DATE,
    escape_attempts INT,
    neutered BOOLEAN,
    weight_kg DECIMAL
);

ALTER TABLE
    animals
ADD
    COLUMN species VARCHAR(50);

CREATE TABLE owners (
    id INT GENERATED BY DEFAULT AS IDENTITY,
    full_name VARCHAR(50),
    age INT,
    PRIMARY KEY (full_name)
);

CREATE TABLE species (
    id INT GENERATED BY DEFAULT AS IDENTITY,
    name VARCHAR(50),
    PRIMARY KEY (name)
);

-- Removing species column
ALTER TABLE
    animals DROP COLUMN species;

-- First Creating species_id column
ALTER TABLE
    animals
ADD
    COLUMN species_id VARCHAR(50);

-- Then Referencing it as a foreign key
ALTER TABLE
    animals
ADD
    CONSTRAINT species_fk FOREIGN KEY (species_id) REFERENCES species (name);

-- First Creating owner_id column
ALTER TABLE
    animals
ADD
    COLUMN owner_id INT;

-- Then Referencing it as a foreign key
ALTER TABLE
    animals
ADD
    CONSTRAINT fk_owners FOREIGN KEY (owner_id) REFERENCES owners (full_name);

CREATE TABLE vets (
    id INT GENERATED BY DEFAULT AS IDENTITY,
    name VARCHAR(50),
    age INT,
    date_of_graduation DATE,
    PRIMARY KEY (id)
);