-- Создание таблицы больниц
CREATE TABLE hospitals (
    hospital_id SERIAL PRIMARY KEY,
    name VARCHAR(200) NOT NULL,
    inn VARCHAR(12) UNIQUE NOT NULL,
    address TEXT
);

-- Создание таблицы отделений
CREATE TABLE departments (
    hospital_id INT,
    department_id SERIAL,
    name VARCHAR(200),
    head_of_department VARCHAR(200),

    PRIMARY KEY (hospital_id, department_id),

    FOREIGN KEY (hospital_id)
    REFERENCES hospitals(hospital_id)
);

-- Таблица должностей
CREATE TABLE positions (
    position_id SERIAL PRIMARY KEY,
    name VARCHAR(100) UNIQUE
);

-- Таблица врачей
CREATE TABLE doctors (
    doctor_inn VARCHAR(12) PRIMARY KEY,
    hospital_id INT,
    department_id INT,
    full_name VARCHAR(200),
    position_id INT,

    FOREIGN KEY (hospital_id, department_id)
    REFERENCES departments(hospital_id, department_id),

    FOREIGN KEY (position_id)
    REFERENCES positions(position_id)
);

-- Таблица диагнозов
CREATE TABLE diagnoses (
    diagnosis_id SERIAL PRIMARY KEY,
    name VARCHAR(200),
    treatment TEXT
);

-- Таблица пациентов
CREATE TABLE patients (
    patient_id SERIAL PRIMARY KEY,

    hospital_id INT,
    department_id INT,
    doctor_inn VARCHAR(12),
    diagnosis_id INT,

    admission_date DATE,
    discharge_date DATE,
    diagnosis_date DATE,

    full_name VARCHAR(200),
    patient_inn VARCHAR(12) UNIQUE,

    discharge_state VARCHAR(100) DEFAULT 'treatment',

    CHECK (discharge_date IS NULL OR discharge_date >= admission_date),

    FOREIGN KEY (hospital_id, department_id)
    REFERENCES departments(hospital_id, department_id),

    FOREIGN KEY (doctor_inn)
    REFERENCES doctors(doctor_inn),

    FOREIGN KEY (diagnosis_id)
    REFERENCES diagnoses(diagnosis_id)
);