/* Database schema to keep the structure of entire database. */

CREATE TABLE animals
(
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    date_of_birth date NOT NULL,
    escape_attempts integer DEFAULT 0,
    neutered boolean NOT NULL,
    weight_kg numeric
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS animals
    OWNER to postgres;
