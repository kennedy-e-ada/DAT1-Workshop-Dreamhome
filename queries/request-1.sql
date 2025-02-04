.open dreamhome.sqlite
.mode column


SELECT propertyno, type, postcode, rooms, rent 
FROM propertyforrent 
ORDER BY type;

SELECT COUNT(propertyno) 
FROM propertyforrent 
WHERE rent > 350;

SELECT COUNT(DISTINCT propertyno) 
FROM viewing 
WHERE strftime('%m', viewdate) = '05' 
AND strftime('%Y', viewdate) = '2013';

SELECT COUNT(position), SUM(salary) 
FROM staff 
WHERE position = 'Manager';

SELECT MIN(salary), MAX(salary), AVG(salary) 
FROM staff;
-- 1.1

SELECT branchno, COUNT(staffno), SUM(salary) 
FROM staff 
GROUP BY branchno;

SELECT branchno, COUNT(staffno), SUM(salary) 
FROM staff 
GROUP BY branchno 
HAVING COUNT(staffno) > 1;

SELECT s.staffno, s.fname, s.lname 
FROM staff s 
JOIN branch b 
ON s.branchno = b.branchno 
WHERE b.street = '163 Main St';


SELECT staffno, fname, lname, salary, 
       (salary - (SELECT AVG(salary) FROM staff)) as salary_above_avg
FROM staff
WHERE salary > (SELECT AVG(salary) FROM staff);

SELECT propertyno, street, city, postcode, type, rent 
FROM propertyforrent 
WHERE staffno
IN ( 
    SELECT staffno 
    FROM staff 
    WHERE branchno = ( 
        SELECT branchno 
        FROM branch 
        WHERE street = '163 Main St')
    );


-- SELECT staffno, fname, lname FROM staff WHERE salary > SOME (SELECT salary FROM staff WHERE branchno = 'B052');

SELECT staffno, fname, lname 
FROM staff 
WHERE salary > (
    SELECT MAX (salary) 
    FROM staff 
    WHERE branchno = 'B052');
-- 1.2



-- 1.3


