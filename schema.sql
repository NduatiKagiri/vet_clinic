/* Database schema to keep the structure of entire database. */

CREATE TABLE animals
(
    id integer NOT NULL PRIMARY KEY,
    name character varying(100) NOT NULL,
    date_of_birth date NOT NULL,
    escape_attempts integer DEFAULT 0,
    neutered boolean NOT NULL,
    weight_kg numeric
);

TABLESPACE pg_default;

ALTER TABLE IF EXISTS animals
    OWNER to postgres;

-- Day 2. Query and Update Animals Table
ALTER TABLE animals
    ADD species character varying(200);

-- Day 3. Query multiple tables
CREATE TABLE owners
(
    id integer NOT NULL PRIMARY KEY,
    full_name character varying(200) NOT NULL,
    age integer
);

CREATE TABLE species
(
    id integer NOT NULL PRIMARY KEY,
    full_name character varying(200) NOT NULL
);

ALTER TABLE animals
    DROP COLUMN species,
    ADD species_id integer,
    ADD owner_id integer;

ALTER TABLE animals
    ADD CONSTRAINT fk_animal_species FOREIGN KEY (species_id) REFERENCES species (id),
    ADD CONSTRAINT fk_animal_owner FOREIGN KEY (owner_id) REFERENCES owners (id);
