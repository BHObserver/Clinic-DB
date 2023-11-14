-- Create tables
CREATE TABLE patients (
    id SERIAL PRIMARY KEY,
    name VARCHAR,
    date_of_birth DATE
);

CREATE TABLE medical_histories (
    id SERIAL PRIMARY KEY,
    admitted_at TIMESTAMP,
    patient_id INT,
    status VARCHAR,
    FOREIGN KEY (patient_id) REFERENCES patients(id)
);
