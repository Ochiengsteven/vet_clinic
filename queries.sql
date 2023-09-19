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
