CREATE TABLE Menu_Items (
    item_id NUMBER PRIMARY KEY,
    item_name VARCHAR2(100) NOT NULL,
    price NUMBER(10,2) NOT NULL,
    available CHAR(1) DEFAULT 'Y' NOT NULL,
    CONSTRAINT chk_item_price CHECK (price >= 0),
    CONSTRAINT chk_item_available CHECK (available IN ('Y','N'))
);

CREATE TABLE Orders (
    order_id NUMBER PRIMARY KEY,
    customer_name VARCHAR2(100) NOT NULL,
    order_date DATE DEFAULT SYSDATE NOT NULL,
    total_amount NUMBER(10,2) DEFAULT 0 NOT NULL
);

CREATE TABLE Order_Items (
    order_item_id NUMBER PRIMARY KEY,
    order_id NUMBER NOT NULL,
    item_id NUMBER NOT NULL,
    quantity NUMBER NOT NULL,
    unit_price NUMBER(10,2) NOT NULL,
    CONSTRAINT fk_order_items_order FOREIGN KEY (order_id)
        REFERENCES Orders(order_id),
    CONSTRAINT fk_order_items_item FOREIGN KEY (item_id)
        REFERENCES Menu_Items(item_id),
    CONSTRAINT chk_order_quantity CHECK (quantity > 0)
);

CREATE SEQUENCE order_seq START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE order_item_seq START WITH 1 INCREMENT BY 1;

INSERT INTO Menu_Items VALUES (1, 'Chicken Burger', 180, 'Y');
INSERT INTO Menu_Items VALUES (2, 'Coffee', 80, 'Y');
INSERT INTO Menu_Items VALUES (3, 'Sandwich', 120, 'Y');
COMMIT;
