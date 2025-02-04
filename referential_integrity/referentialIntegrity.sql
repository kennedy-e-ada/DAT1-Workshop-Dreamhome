.open referentialIntegrity.sqlite

DROP TABLE IF EXISTS contacts;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS voter;
DROP TABLE IF EXISTS books;

CREATE TABLE contacts (
    contactID INTEGER PRIMARY KEY NOT NULL,
    fname VARCHAR(25) CHECK (length(fname) >= 1),
    lname VARCHAR(25) CHECK (length(lname) >= 1),
    email VARCHAR(40) CHECK (email LIKE '%@%'),
    phone CHAR(11) DEFAULT '0000000000' CHECK (length(phone) = 10)
);

INSERT INTO contacts(fname, lname, email,phone)
VALUES ('Ken', 'Ellis', 'kennedyellis@email.com', '1234567899'),
       ('Juhi', 'Shah', 'juhishah@email.com', '1234567891'),
       ('Charlese', 'Briggs', 'charlesebriggs@email.com', '1234567654');

CREATE TABLE products (
    product_id INTEGER PRIMARY KEY NOT NULL,
    product_name VARCHAR(25),
    list_price FLOAT,
    discount FLOAT,

    CHECK (list_price >= discount AND 
        discount >= 0 AND 
        list_price >= 0) 
);

INSERT INTO products(product_name, list_price,discount)
VALUES ('computer', '500', '10');

CREATE TABLE voter(
  voter_id INTEGER PRIMARY KEY,
  name VARCHAR(25),
  age INTEGER,
  dob DATE,
  check(age >= 18 and voter_id in(101,102,103,104,105,106))
 );

INSERT INTO voter(voter_id,name, age,dob)
VALUES ('101','Ken', '19', '26-06-2005');

CREATE TABLE books(
    id INTEGER PRIMARY KEY,
    name 	VARCHAR(50) ,
    price 	INTEGER ,
    disc_Price	INTEGER,
    description	VARCHAR(1000),

    CHECK (price > disc_Price AND 
        disc_Price > 0)
);

INSERT INTO books(name, price, disc_price, description)
VALUES ('Book 1', '20', '10', 'a book');
