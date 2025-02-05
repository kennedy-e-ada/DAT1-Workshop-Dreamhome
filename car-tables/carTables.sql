.open carTables.sqlite
.mode column
.mode box

PRAGMA foreign_keys = ON;


DROP TABLE IF EXISTS drivers;
DROP TABLE IF EXISTS vehicles;

CREATE TABLE vehicles (
    vehicleID INTEGER PRIMARY KEY NOT NULL,
    odoReading INTEGER,
    name TEXT
);

CREATE TABLE drivers (
    driverID INTEGER PRIMARY KEY NOT NULL,
    age INTEGER,
    car INTEGER,
    FOREIGN KEY (car) REFERENCES vehicles(vehicleID)
);

INSERT INTO vehicles (odoReading, name) 
VALUES (15000, 'Ford Focus'), 
       (85000, 'Honda Civic'),
       (250000, 'Toyota Camry'),
       (5500, 'Tesla Model 3'),
       (120000, 'Chevrolet Silverado'),
       (35000, 'BMW X5');

INSERT INTO drivers (age, car)
VALUES (35, 3),
       (28, 1),
       (52, 5),
       (22, 4);

SELECT * 
FROM vehicles v 
INNER JOIN drivers d 
ON v.vehicleID = d.car;

SELECT *
FROM vehicles v
LEFT OUTER JOIN drivers d
ON v.vehicleID = d.car;

SELECT *
FROM vehicles v
FULL OUTER JOIN drivers d
ON v.vehicleID = d.car;

SELECT *
FROM vehicles v
RIGHT OUTER JOIN drivers d
ON v.vehicleID = d.car;

SELECT *
FROM vehicles v
LEFT JOIN drivers d
ON v.vehicleID = d.car;