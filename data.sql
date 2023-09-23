-- Insert new data into the animals table
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg, species)
VALUES
    ('Charmander', '2020-02-08', 0, FALSE, -11.00, 'unspecified'),
    ('Plantmon', '2021-11-15', 2, TRUE, -5.7, 'unspecified'),
    ('Squirtle', '1993-04-02', 3, FALSE, -12.13, 'unspecified'),
    ('Angemon', '2005-06-12', 1, TRUE, -45.00, 'unspecified'),
    ('Boarmon', '2005-06-07', 7, TRUE, 20.4, 'unspecified'),
    ('Blossom', '1998-10-13', 3, TRUE, 17.00, 'unspecified'),
    ('Ditto', '2022-05-14', 4, TRUE, 22.00, 'unspecified');

    -- Insert data into the owners table
INSERT INTO owners (full_name, age)
VALUES
    ('Sam Smith', 34),
    ('Jennifer Orwell', 19),
    ('Bob', 45),
    ('Melody Pond', 77),
    ('Dean Winchester', 14),
    ('Jodie Whittaker', 38);

-- Insert data into the species table
INSERT INTO species (name)
VALUES
    ('Pokemon'),
    ('Digimon');

-- Modify existing animals to include species_id and owner_id
UPDATE animals SET species_id = (CASE WHEN name LIKE '%mon' THEN 2 ELSE 1 END);

-- Assign owners to animals
UPDATE animals SET owner_id = 4 WHERE name = 'Charmander';
UPDATE animals SET owner_id = 4 WHERE name = 'Squirtle';
UPDATE animals SET owner_id = 4 WHERE name = 'Blossom';
UPDATE animals SET owner_id = 5 WHERE name = 'Angemon';
UPDATE animals SET owner_id = 5 WHERE name = 'Boarmon';
UPDATE animals SET owner_id = 1 WHERE name = 'Agumon';
UPDATE animals SET owner_id = 2 WHERE name IN ('Gabumon', 'Pikachu');
UPDATE animals SET owner_id = 3 WHERE name IN ('Devimon', 'Plantmon');

-- Insert data into the visits table
INSERT INTO visits (visit_id, animal_id, vet_id, visit_date)
VALUES
    (1, 1, 1, '2020-05-24'),
    (2, 1, 3, '2020-07-22'),
    (3, 2, 4, '2021-02-02'),
    (4, 3, 2, '2020-01-05'),
    (5, 3, 2, '2020-03-08'),
    (6, 3, 2, '2020-05-14'),
    (7, 4, 3, '2021-05-04'),
    (8, 5, 4, '2021-02-24'),
    (9, 6, 2, '2019-12-21'),
    (10, 6, 1, '2020-08-10'),
    (11, 6, 2, '2021-04-07'),
    (12, 7, 3, '2019-09-29'),
    (13, 8, 4, '2020-10-03'),
    (14, 8, 4, '2020-11-04'),
    (15, 9, 2, '2019-01-24'),
    (16, 9, 2, '2019-05-15'),
    (17, 9, 2, '2020-02-27'),
    (18, 9, 2, '2020-08-03'),
    (19, 10, 3, '2020-05-24'),
    (20, 10, 1, '2021-01-11');

