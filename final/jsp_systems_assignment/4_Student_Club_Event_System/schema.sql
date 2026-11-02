CREATE TABLE Club_Members (
    member_id NUMBER PRIMARY KEY,
    student_id VARCHAR2(30) UNIQUE NOT NULL,
    member_name VARCHAR2(100) NOT NULL,
    email VARCHAR2(100) UNIQUE NOT NULL
);

CREATE TABLE Club_Events (
    event_id NUMBER PRIMARY KEY,
    event_name VARCHAR2(150) NOT NULL,
    event_date DATE NOT NULL,
    venue VARCHAR2(150) NOT NULL
);

CREATE TABLE Event_Registrations (
    registration_id NUMBER PRIMARY KEY,
    member_id NUMBER NOT NULL,
    event_id NUMBER NOT NULL,
    registration_date DATE DEFAULT SYSDATE NOT NULL,
    CONSTRAINT fk_registration_member FOREIGN KEY (member_id)
        REFERENCES Club_Members(member_id),
    CONSTRAINT fk_registration_event FOREIGN KEY (event_id)
        REFERENCES Club_Events(event_id)
);

CREATE UNIQUE INDEX uq_member_event
ON Event_Registrations(member_id, event_id);

CREATE SEQUENCE registration_seq START WITH 1 INCREMENT BY 1;

INSERT INTO Club_Members VALUES (1, '241010214', 'Sadia Hossain', 'sadia@example.com');
INSERT INTO Club_Events VALUES (1, 'Programming Contest', SYSDATE + 7, 'Computer Lab');
INSERT INTO Club_Events VALUES (2, 'Cultural Night', SYSDATE + 14, 'Auditorium');
COMMIT;
