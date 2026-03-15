CREATE OR REPLACE FUNCTION update_patient_count()
RETURNS TRIGGER AS $$
BEGIN
    UPDATE doctors
    SET patient_count = patient_count + 1
    WHERE doctor_inn = NEW.doctor_inn;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_patient_insert
AFTER INSERT ON patients
FOR EACH ROW
EXECUTE FUNCTION update_patient_count();