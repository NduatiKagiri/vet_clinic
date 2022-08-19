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

SELECT neutered, MAX(escape_attempts)
FROM animals
GROUP BY neutered;

SELECT species, MIN(weight_kg), MAX(weight_kg)
FROM animals
GROUP BY species;

SELECT species, AVG(escape_attempts)
FROM animals
WHERE EXTRACT( YEAR FROM date_of_birth ) BETWEEN 1990 AND 2000
GROUP BY species;

-- Day 3. Query multiple tables
SELECT name, owner_id
FROM animals
JOIN owners ON owners.id = animals.owner_id
WHERE owner_id = 4;

SELECT name, species_id, full_name
FROM animals
JOIN species ON animals.species_id = species.id
WHERE species_id = 1;

SELECT full_name, name
FROM owners
FULL JOIN animals ON owners.id = animals.owner_id;

SELECT full_name, COUNT(species_id)
FROM species
JOIN animals ON species.id = animals.species_id
GROUP BY full_name;

SELECT species.full_name, owners.full_name, name
FROM animals
JOIN owners ON owners.id = animals.owner_id
JOIN species ON species.id = animals.species_id
WHERE species.id = 2 AND owner_id = 2;

SELECT full_name, COUNT(owner_id) AS ocurrence
FROM animals
JOIN owners ON owners.id = animals.owner_id
GROUP BY full_name
ORDER BY ocurrence DESC
LIMIT 1;

-- Day 4. Join Tables
SELECT animals.name, vets.name, visits.visit_date as dates
FROM animals
JOIN visits ON visits.animal = animals.id
JOIN vets ON vets.id = visits.vet
WHERE visits.vet = 1
ORDER BY dates DESC
LIMIT 1

SELECT vets.name, COUNT(*) as total
FROM visits
JOIN vets ON visits.vet = vets.id
WHERE visits.vet = 3
GROUP BY 1;

SELECT vets.name, species.full_name
FROM specializations
JOIN species ON specializations.species = species.id
FULL JOIN vets ON specializations.vet = vets.id

SELECT animals.name, vets.name, visits.visit_date
FROM visits
JOIN animals ON visits.animal = animals.id
JOIN vets ON visits.vet = vets.id
WHERE visits.vet = 3
AND visits.visit_date BETWEEN '2020-04-01' and '2020-08-30';

SELECT animals.name, COUNT(*) as total
FROM visits
JOIN animals ON visits.animal = animals.id
GROUP BY 1
ORDER BY total DESC
LIMIT 1;

SELECT animals.name, vets.name, visits.visit_date as dates
FROM visits
JOIN animals ON visits.animal = animals.id
JOIN vets ON visits.vet = vets.id
WHERE visits.vet = 2
ORDER BY dates
LIMIT 1;

SELECT animals.name as animal_name,
species.full_name as animal_species,
animals.date_of_birth as animal_birth,
animals.escape_attempts as animal_escapes,
animals.neutered as neutered,
owners.full_name as animal_owner,
animals.weight_kg as animal_weight,
vets.name as vet_name,
vets.age as vet_age,
visits.visit_date as visit_date
FROM visits
JOIN animals ON visits.animal = animals.id
JOIN species ON species.id = animals.species_id
JOIN owners ON owners.id = animals.owner_id
JOIN vets ON visits.vet = vets.id
ORDER BY visit_date DESC
LIMIT 1;

SELECT COUNT(*)
FROM visits
LEFT JOIN animals ON visits.animal = animals.id
LEFT JOIN vets ON visits.vet = vets.id
WHERE animals.species_id NOT IN (
    SELECT species FROM specializations
	WHERE specializations.vet = vets.id
);

SELECT species.full_name as species, COUNT(*) as total
FROM visits
LEFT JOIN animals ON visits.animal = animals.id
LEFT JOIN species ON animals.species_id = species.id
WHERE visits.vet = 2
GROUP BY species
ORDER BY total DESC
LIMIT 1;
