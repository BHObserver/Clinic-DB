-- Create tables


CREATE TABLE invoice_items (
    id SERIAL PRIMARY KEY,
    unit_price DECIMAL,
    quantity INT,
    total_price DECIMAL,
    invoice_id INT,
    treatment_id INT,
    FOREIGN KEY (invoice_id) REFERENCES invoices(id),
    FOREIGN KEY (treatment_id) REFERENCES treatments(id)
);

CREATE TABLE invoices (
    id SERIAL PRIMARY KEY,
    total_amount DECIMAL,
    generated_at TIMESTAMP,
    payed_at TIMESTAMP,
    medical_history_id INT,
    FOREIGN KEY (medical_history_id) REFERENCES medical_histories(id)
);

-- Create many-to-many join table for medical_histories and treatments
CREATE TABLE medical_histories_treatments (
    medical_history_id INT,
    treatment_id INT,
    PRIMARY KEY (medical_history_id, treatment_id),
    FOREIGN KEY (medical_history_id) REFERENCES medical_histories(id),
    FOREIGN KEY (treatment_id) REFERENCES treatments(id)
);

-- Add indexes for foreign keys
CREATE INDEX idx_patient_id ON medical_histories(patient_id);
CREATE INDEX idx_invoice_id ON invoice_items(invoice_id);
CREATE INDEX idx_treatment_id ON invoice_items(treatment_id);
CREATE INDEX idx_medical_history_id ON invoices(medical_history_id);

-- Add FK indexes
CREATE INDEX idx_fk_patient_id ON medical_histories(patient_id);
CREATE INDEX idx_fk_invoice_id ON invoice_items(invoice_id);
CREATE INDEX idx_fk_treatment_id ON invoice_items(treatment_id);
CREATE INDEX idx_fk_medical_history_id ON invoices(medical_history_id);
