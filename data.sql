/* Populate database with sample data. */

INSERT INTO animals(id, name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('1', 'Agumon', '2020-2-3', '0', 'true', '10.23');

INSERT INTO animals(id, name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('2', 'Gabumon', '2018-11-15', '2', 'true', '8');

INSERT INTO animals(id, name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('3', 'Pikachu', '2021-1-7', '1', 'false', '15.04');

INSERT INTO animals(id, name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('4', 'Devimon', '2017-5-12', '5', 'true', '11');

-- Day 2. Query and Update Animals Table
INSERT INTO animals(id, name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('5', 'Charmander', '2020-2-8', '0', 'false', '-11');

INSERT INTO animals(id, name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('6', 'Plantmon', '2021-11-15', '2', 'true', '-5.7');

INSERT INTO animals(id, name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('7', 'Squirtle', '1993-4-2', '3', 'false', '-12.13');

INSERT INTO animals(id, name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('8', 'Angemon', '2005-6-12', '1', 'true', '-45');

INSERT INTO animals(id, name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('9', 'Boarmon', '2005-6-7', '7', 'true', '20.4');

INSERT INTO animals(id, name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('10', 'Blossom', '1998-10-13', '3', 'true', '17');

INSERT INTO animals(id, name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('11', 'Ditto', '2022-5-14', '4', 'true', '22');

-- Day 3. Query multiple tables
INSERT INTO owners(id, full_name, age)
VALUES ('1', 'Sam Smith', '34');

INSERT INTO owners(id, full_name, age)
VALUES ('2', 'Jennifer Orwell', '19');

INSERT INTO owners(id, full_name, age)
VALUES ('3', 'Bob', '45');

INSERT INTO owners(id, full_name, age)
VALUES ('4', 'Melody Pond', '77');

INSERT INTO owners(id, full_name, age)
VALUES ('5', 'Dean Winchester', '14');

INSERT INTO owners(id, full_name, age)
VALUES ('6', 'Jodie Whittaker', '38');

INSERT INTO species(id, full_name)
VALUES ('1', 'Pokemon');

INSERT INTO species(id, full_name)
VALUES ('2', 'Digimon');

UPDATE animals
SET species_id = '2'
WHERE name LIKE '%mon';

UPDATE animals
SET species_id = '1'
WHERE species_id IS NULL;

UPDATE animals
SET owner_id = '1'
WHERE name = 'Agumon';

UPDATE animals
SET owner_id = '2'
WHERE name = 'Gabumon' OR name = 'Pikachu';

UPDATE animals
SET owner_id = '3'
WHERE name = 'Devimon' OR name = 'Plantmon';

UPDATE animals
SET owner_id = '4'
WHERE name = 'Charmander' OR name = 'Squirtle' OR name = 'Blossom';

UPDATE animals
SET owner_id = '5'
WHERE name = 'Angemon' OR name = 'Boarmon';

-- Day 4. Join Tables
INSERT INTO vets(id, name, age, date_of_graduation)
VALUES ('1', 'William Tatcher', '45', '2000-04-23');

INSERT INTO vets(id, name, age, date_of_graduation)
VALUES ('2', 'Maisy Smith', '26', '2019-01-17');

INSERT INTO vets(id, name, age, date_of_graduation)
VALUES ('3', 'Stephanie Mendez', '64', '1981-05-04');

INSERT INTO vets(id, name, age, date_of_graduation)
VALUES ('4', 'Jack Harkness', '38', '2008-06-08');

INSERT INTO specializations(species, vet)
VALUES ('1', '1');

INSERT INTO specializations(species, vet)
VALUES ('2', '3');

INSERT INTO specializations(species, vet)
VALUES ('1', '3');

INSERT INTO specializations(species, vet)
VALUES ('2', '4');

INSERT INTO visits(animal, vet, visit_date)
VALUES ('1', '1', '2020-05-24');

INSERT INTO visits(animal, vet, visit_date)
VALUES ('1', '3', '2020-07-22');

INSERT INTO visits(animal, vet, visit_date)
VALUES ('2', '4', '2021-02-02');

INSERT INTO visits(animal, vet, visit_date)
VALUES ('3', '2', '2020-01-05');

INSERT INTO visits(animal, vet, visit_date)
VALUES ('3', '2', '2020-03-08');

INSERT INTO visits(animal, vet, visit_date)
VALUES ('3', '2', '2020-05-14');

INSERT INTO visits(animal, vet, visit_date)
VALUES ('4', '3', '2021-05-04');

INSERT INTO visits(animal, vet, visit_date)
VALUES ('5', '4', '2021-02-24');

INSERT INTO visits(animal, vet, visit_date)
VALUES ('6', '2', '2019-12-21');

INSERT INTO visits(animal, vet, visit_date)
VALUES ('6', '1', '2020-08-10');

INSERT INTO visits(animal, vet, visit_date)
VALUES ('6', '2', '2021-04-07');

INSERT INTO visits(animal, vet, visit_date)
VALUES ('7', '3', '2019-09-29');

INSERT INTO visits(animal, vet, visit_date)
VALUES ('8', '4', '2020-10-03');

INSERT INTO visits(animal, vet, visit_date)
VALUES ('8', '4', '2020-11-04');

INSERT INTO visits(animal, vet, visit_date)
VALUES ('9', '2', '2019-01-24');

INSERT INTO visits(animal, vet, visit_date)
VALUES ('9', '2', '2019-05-15');

INSERT INTO visits(animal, vet, visit_date)
VALUES ('9', '2', '2020-02-27');

INSERT INTO visits(animal, vet, visit_date)
VALUES ('9', '2', '2020-08-03');

INSERT INTO visits(animal, vet, visit_date)
VALUES ('10', '3', '2020-05-24');

INSERT INTO visits(animal, vet, visit_date)
VALUES ('10', '1', '2021-01-11');
