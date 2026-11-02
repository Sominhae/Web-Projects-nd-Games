CREATE TABLE Doctors (
    doctor_id NUMBER PRIMARY KEY,
    doctor_name VARCHAR2(100) NOT NULL,
    specialization VARCHAR2(100) NOT NULL
);

CREATE TABLE Patients (
    patient_id NUMBER PRIMARY KEY,
    patient_name VARCHAR2(100) NOT NULL,
    phone VARCHAR2(20) NOT NULL
);

CREATE TABLE Appointments (
    appointment_id NUMBER PRIMARY KEY,
    doctor_id NUMBER NOT NULL,
    patient_id NUMBER NOT NULL,
    appointment_date DATE NOT NULL,
    reason VARCHAR2(250),
    status VARCHAR2(20) DEFAULT 'BOOKED' NOT NULL,
    CONSTRAINT fk_appt_doctor FOREIGN KEY (doctor_id)
        REFERENCES Doctors(doctor_id),
    CONSTRAINT fk_appt_patient FOREIGN KEY (patient_id)
        REFERENCES Patients(patient_id),
    CONSTRAINT chk_appt_status CHECK (status IN ('BOOKED','CANCELLED','COMPLETED'))
);

CREATE UNIQUE INDEX uq_doctor_appointment
ON Appointments(doctor_id, appointment_date);

CREATE SEQUENCE appointment_seq START WITH 1 INCREMENT BY 1;

INSERT INTO Doctors VALUES (1, 'Dr. Rahman', 'Cardiology');
INSERT INTO Doctors VALUES (2, 'Dr. Karim', 'Dermatology');
INSERT INTO Patients VALUES (101, 'Sadia Hossain', '01700000000');
COMMIT;
