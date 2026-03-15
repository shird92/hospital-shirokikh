CREATE VIEW v_patients_simple AS
SELECT patient_id, full_name, admission_date, discharge_date
FROM patients;

CREATE VIEW v_patients_with_doctors AS
SELECT
    p.full_name AS patient,
    d.full_name AS doctor,
    p.admission_date
FROM patients p
JOIN doctors d
ON p.doctor_inn = d.doctor_inn;