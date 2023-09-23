-- Create the vet_clinic database if it doesn't exist
CREATE DATABASE IF NOT EXISTS vet_clinic;

-- Use the vet_clinic database
USE vet_clinic;

-- Create the animals table
CREATE TABLE IF NOT EXISTS animals (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255),
    date_of_birth DATE,
    escape_attempts INT,
    neutered BOOLEAN,
    weight_kg DECIMAL(5, 2)
);

-- Add the species column to the animals table
ALTER TABLE animals
ADD COLUMN species VARCHAR(255);

-- Create the owners table
CREATE TABLE IF NOT EXISTS owners (
    id SERIAL PRIMARY KEY,
    full_name VARCHAR(255),
    age INT
);

-- Create the species table
CREATE TABLE IF NOT EXISTS species (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255)
);

-- Create a temporary table to store the updated animals data
CREATE TABLE animals_temp AS
SELECT
    id,
    name,
    date_of_birth,
    escape_attempts,
    neutered,
    weight_kg,
    CASE WHEN name LIKE '%mon' THEN 2 ELSE 1 END AS species_id
FROM animals;

-- Drop the old animals table
DROP TABLE animals;

-- Rename the temporary table to animals
ALTER TABLE animals_temp RENAME TO animals;

-- Add the owner_id column to the animals table
ALTER TABLE animals
ADD COLUMN owner_id INT,
ADD FOREIGN KEY (owner_id) REFERENCES owners(id);
