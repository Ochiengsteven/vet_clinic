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