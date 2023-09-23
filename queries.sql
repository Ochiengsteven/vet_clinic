-- Transaction 1: Set species to 'unspecified' for all animals, then rollback and verify
START TRANSACTION;

UPDATE animals SET species = 'unspecified';

-- Verify the change (should show 'unspecified')
SELECT * FROM animals;

ROLLBACK;

-- Verify the change is rolled back (should show NULL for species)
SELECT * FROM animals;

-- Transaction 2: Update species for specific animals, commit, and verify
START TRANSACTION;

UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon';
UPDATE animals SET species = 'pokemon' WHERE species IS NULL;

-- Verify the changes
SELECT * FROM animals;

COMMIT;

-- Verify changes persist after commit
SELECT * FROM animals;

-- Transaction 3: Delete all records, then rollback and verify
START TRANSACTION;

DELETE FROM animals;

-- Verify that records are deleted (should show no rows)
SELECT * FROM animals;

ROLLBACK;

-- Verify that records are not deleted
SELECT * FROM animals;

-- Transaction 4: Delete animals born after Jan 1, 2022, and update weights, then commit
START TRANSACTION;

DELETE FROM animals WHERE date_of_birth > '2022-01-01';

-- Create a savepoint
SAVEPOINT weight_update;

-- Update weights
UPDATE animals SET weight_kg = weight_kg * -1;

-- Rollback to the savepoint (undo weight updates)
ROLLBACK TO weight_update;

-- Update negative weights
UPDATE animals SET weight_kg = weight_kg * -1 WHERE weight_kg < 0;

-- Commit the transaction
COMMIT;

-- How many animals are there?
SELECT COUNT(*) AS total_animals FROM animals;

-- How many animals have never tried to escape?
SELECT COUNT(*) AS no_escape_animals FROM animals WHERE escape_attempts = 0;

-- What is the average weight of animals?
SELECT AVG(weight_kg) AS avg_weight FROM animals;

-- Who escapes the most, neutered or not neutered animals?
SELECT neutered, MAX(escape_attempts) AS max_escape_attempts
FROM animals
GROUP BY neutered;

-- What is the minimum and maximum weight of each type of animal?
SELECT species, MIN(weight_kg) AS min_weight, MAX(weight_kg) AS max_weight
FROM animals
GROUP BY species;

-- What is the average number of escape attempts per animal type of those born between 1990 and 2000?
SELECT species, AVG(escape_attempts) AS avg_escape_attempts
FROM animals
WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-12-31'
GROUP BY species;

