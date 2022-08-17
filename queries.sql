/*Queries that provide answers to the questions from all projects.*/

SELECT * FROM animals WHERE Name LIKE '%mon';

SELECT * FROM animals WHERE
EXTRACT( YEAR FROM date_of_birth ) BETWEEN 2016 AND 2019;

SELECT * FROM animals WHERE
neutered=true and escape_attempts<3;

SELECT date_of_birth FROM animals WHERE
name='Agumon' OR name='Pikachu';

SELECT name, escape_attempts FROM animals WHERE
weight_kg>10.5;

SELECT * FROM animals WHERE name!='Gabumon';

SELECT * FROM animals WHERE
weight_kg>=10.4 and weight_kg<=17.3;

-- Day 2. Query and Update Animals Table
BEGIN TRANSACTION;

UPDATE animals
SET species = 'unspecified';

SELECT species FROM animals;

ROLLBACK TRANSACTION;

SELECT species FROM animals;

BEGIN TRANSACTION;

UPDATE animals
SET species = 'digimon'
WHERE Name LIKE '%mon';

UPDATE animals
SET species = 'pokemon'
WHERE species IS NULL;

COMMIT TRANSACTION;

SELECT species FROM animals;

BEGIN TRANSACTION;

DELETE FROM animals;

ROLLBACK TRANSACTION;

SELECT * FROM animals;

BEGIN TRANSACTION;

DELETE FROM animals
WHERE date_of_birth > '2022-01-01';

SELECT * FROM animals;

SAVEPOINT delete_young;

UPDATE animals
SET weight_kg = weight_kg * -1;

SELECT weight_kg FROM animals;

ROLLBACK TO delete_young;

UPDATE animals
SET weight_kg = weight_kg * -1
WHERE weight_kg < 0;

COMMIT TRANSACTION;

SELECT weight_kg FROM animals;

SELECT COUNT(*) FROM animals;

SELECT COUNT(escape_attempts) FROM animals
WHERE escape_attempts = 0;

SELECT AVG(weight_kg) FROM animals;

SELECT neutered, SUM(escape_attempts)
FROM animals
GROUP BY neutered;

SELECT species, MIN(weight_kg), MAX(weight_kg)
FROM animals
GROUP BY species;

SELECT species, AVG(escape_attempts)
FROM animals
WHERE EXTRACT( YEAR FROM date_of_birth ) BETWEEN 1990 AND 2000
GROUP BY species;
