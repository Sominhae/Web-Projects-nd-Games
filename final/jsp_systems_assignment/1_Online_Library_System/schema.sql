CREATE TABLE Books (
    book_id NUMBER PRIMARY KEY,
    title VARCHAR2(100) NOT NULL,
    author VARCHAR2(100) NOT NULL,
    total_copies NUMBER NOT NULL,
    available_copies NUMBER NOT NULL,
    CONSTRAINT chk_book_copies CHECK (
        total_copies >= 0 AND
        available_copies >= 0 AND
        available_copies <= total_copies
    )
);

CREATE TABLE Members (
    member_id NUMBER PRIMARY KEY,
    name VARCHAR2(100) NOT NULL,
    email VARCHAR2(100) UNIQUE NOT NULL
);

CREATE TABLE Borrowings (
    borrow_id NUMBER PRIMARY KEY,
    book_id NUMBER NOT NULL,
    member_id NUMBER NOT NULL,
    borrow_date DATE DEFAULT SYSDATE NOT NULL,
    due_date DATE NOT NULL,
    return_date DATE,
    CONSTRAINT fk_borrow_book FOREIGN KEY (book_id)
        REFERENCES Books(book_id),
    CONSTRAINT fk_borrow_member FOREIGN KEY (member_id)
        REFERENCES Members(member_id)
);

CREATE SEQUENCE borrow_seq START WITH 1 INCREMENT BY 1;

INSERT INTO Books VALUES (1, 'Database Systems', 'Elmasri', 5, 5);
INSERT INTO Books VALUES (2, 'Java Programming', 'Herbert Schildt', 3, 3);
INSERT INTO Members VALUES (101, 'Sadia Hossain', 'sadia@example.com');
COMMIT;
