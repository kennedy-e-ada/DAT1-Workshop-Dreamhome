.open dblPractice.sqlite

--switching on referential integrity rules
PRAGMA foreign_keys = ON;



--Delete table if already exists
DROP TABLE IF EXISTS appearance;
DROP TABLE IF EXISTS contacts;
DROP TABLE IF EXISTS salesStaff;
DROP TABLE IF EXISTS student;
DROP TABLE IF EXISTS employees;

CREATE TABLE contacts (
    contactID INTEGER PRIMARY KEY NOT NULL,
    fname VARCHAR(25) CHECK (length(fname) >= 1),
    lname VARCHAR(25) CHECK (length(lname) >= 1),
    email VARCHAR(40) CHECK (email LIKE '%@%'),
    phone CHAR(11) DEFAULT '00000000000' CHECK (length(phone) = 11)
);

CREATE TABLE appearance (
    appearanceID INTEGER PRIMARY KEY NOT NULL,
    haircolour VARCHAR(20) CHECK (haircolour IN ('black', 'brown', 'green', 'blonde')),
    glasses BOOLEAN,
    contactID INTEGER,
    FOREIGN KEY (contactID) REFERENCES contacts
);

INSERT INTO contacts(fname, lname, email,phone)
VALUES ('Ken', 'Ellis', 'kennedyellis@email.com', '12345678999'),
       ('Juhi', 'Shah', 'juhishah@email.com', '12345678911'),
       ('Charlese', 'Briggs', 'charlesebriggs@email.com', '12345676543');

INSERT INTO appearance (haircolour, glasses, contactID)
VALUES ('brown', TRUE, 1),
       ('black', TRUE, 2),
       ('brown', FALSE, 3);

CREATE TABLE salesStaff (
    employeeID INTEGER PRIMARY KEY NOT NULL,
    salesPerson VARCHAR(25) CHECK (length(salesPerson) >= 1),
    salesOffice VARCHAR(25),
    officeNumber CHAR(11),
    customer1 VARCHAR(25),
    customer2 VARCHAR(25),
    customer3 VARCHAR(25)
);

CREATE TABLE student (
    studentID INTEGER PRIMARY KEY NOT NULL,
    studentName VARCHAR(25),
    majorName VARCHAR(25),
    noOfCreditHours INTEGER
);

CREATE TABLE employees (
    employeeID INTEGER PRIMARY KEY NOT NULL,
    name VARCHAR(25),
    jobCode CHAR(3) CHECK (length(jobCode) = 3),
    job VARCHAR(25),
    statusCode CHAR(2) CHECK (length(statusCode) = 2),
    homeState VARCHAR(25)
);

