--  LAB 8 CRUD
--  Put your answers on the lines after each letter. E.g. your query for question 1A should go on line 6; your query for question 1B should go on line 7...

-- 1 
--  A 
    CREATE TABLE customer (
    email VARCHAR(100) PRIMARY KEY,
    name VARCHAR(100) NOT NULL
    );

--  B 
    CREATE TABLE supplier (
    supplier_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    location VARCHAR(100) NOT NULL
    );

--  C 
    CREATE TABLE order (
    order_id INT PRIMARY KEY,
    email VARCHAR(100) NOT NULL,
    PRIMARY KEY (order_id) REFERENCES order_product (order_id),
    FOREIGN KEY (email) REFERENCES customer (email)
    );

--  D
    CREATE TABLE product (
    product_id INT PRIMARY KEY,
    name VARCHAR(50) PRIMARY KEY,
    price INT NOT NULL,
    brand VARCHAR(50) NOT NULL,
    supplier_id INT NOT NULL,
    PRIMARY KEY (product_id) REFERENCES order_product (product_id),
    FOREIGN KEY (supplier_id) REFERENCES supplier (supplier_id)
    );

--  E 
    CREATE TABLE order_product (
    order_id INT PRIMARY KEY,
    product_id INT PRIMARY KEY,
    PRIMARY KEY (order_id) REFERENCES order (order_id),
    PRIMARY KEY (product_id) REFERENCES product (product_id)
    );


-- 2 
--  A 
    INSERT INTO customer (email, name)
    VALUES ('John@gmail.com', 'John'),
    ('Jane@gmail.com', 'Jane'),
    ('Alice@gmail.com', 'Alice');

--  B
    INSERT INTO supplier (supplier_id, name, location)
    VALUES (1, 'XYZ Electronics', 'Toronto'),
    (2, 'ABC Gadgets', 'Montreal'),
    (3, 'XYZ Furniture', 'Vancouver');

--  C
    INSERT INTO order (order_id, email)
    VALUES (1, 'John@gmail.com'),
    (2, 'Jane@gmail.com'),
    (3, 'John@gmail.com'),
    (4, 'Alice@gmail.com');

--  D
    INSERT INTO product (product_id, name, price, brand, supplier_id)
    VALUES (1, 'Laptop', 800, 'Dell', 1),
    (2, 'Smartphone', 600, 'Apple', 2),
    (3, 'Smartphone', 600, 'Samsung', 2),
    (4, 'Camera', 300, 'Canon', 1),
    (5, 'Chair', 100, 'Herman Miller', 3);

--  E 
    INSERT INTO order_product (order_id, product_id)
    VALUES (1,1),
    (2,2),
    (2,3),
    (3,4),
    (4,5);


-- 3 
--  A
    ALTER TABLE product
    ADD CHECK (price >= 0);

--  B
    UPDATE order_product
    SET order_id = 2
    WHERE product_id = 4;

-- 4 
--  A
    DELETE FROM order_product
    WHERE order_id IN 1, 3;

--  B
    DELETE FROM order
    WHERE order_id IN 1, 3;
