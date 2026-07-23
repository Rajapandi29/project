-- Create Employee Table

CREATE TABLE IF NOT EXISTS employees (

    id SERIAL PRIMARY KEY,

    name VARCHAR(100) NOT NULL,

    email VARCHAR(100) UNIQUE NOT NULL,

    department VARCHAR(100) NOT NULL

);

-- Insert Sample Data

INSERT INTO employees (name,email,department)

VALUES

('Raj','raj@gmail.com','DevOps'),

('John','john@gmail.com','AWS'),

('David','david@gmail.com','Cloud');
