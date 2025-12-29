CREATE DATABASE EMPLOYE_DATA;
DROP DATABASE EMPLOYE_DATA;
USE  EMPLOYE_DATA;

CREATE TABLE EMPLOYE(
   Employee_Id INT PRIMARY KEY,
   Employee_name VARCHAR(50),
   Salary INT,
   Department VARCHAR(50),
   Experience_Years VARCHAR(50),
   Gender VARCHAR(50)
);

INSERT INTO EMPLOYE (Employee_Id,Employee_name,Salary,Department, Experience_Years,Gender)
VALUES
(101,'Ram',46000,'IT',2,'Male'),
(102,'Sita',78000,'IT',3,'Female'),
(103,'Shameer',62000,'Sales',9,'Male'),
(104,'Manoj',35000,'Marketing',3,'Male'),
(105,'kishore',50000,'IT',2,'Male'),
(106,'Sriya',80000,'IT',4,'Female'),
(107,'Gopi',65000,'Banking',3,'Male'),
(108,'Teja',27000,'Sales',1,'Male'),
(109,'Sai',40000,'Marketing',2,'Male'),
(110,'Hari',70000,'Banking',2,'Male');

SELECT * FROM EMPLOYE;


SELECT Department, AVG(Salary) AS AVG_SALARY
FROM EMPLOYE
GROUP BY Department;

SELECT Department, AVG(Salary) AS AVG_SALARY
FROM Employe
GROUP BY Department
HAVING AVG(Salary) > 60000;

SELECT e.*
FROM Employe e
JOIN (
    SELECT Department, MAX(Salary) AS max_Salary
    FROM Employe
    GROUP BY Department
) m
ON e.Department = m.Department
AND e.Salary = m.max_Salary;

SELECT Employee_name,Salary,
CASE
WHEN Salary >= 70000 THEN 'HIGH'
WHEN Salary BETWEEN 50000 AND 69999 THEN 'MEDIUM'
ELSE 'LOW'
END AS SALARY_CATEGORIES
FROM EMPLOYE;

SELECT Experience_Years, AVG(Salary) as AVG_SALARY
FROM EMPLOYE
GROUP BY Experience_Years
ORDER BY Experience_Years;


SELECT MAX(Salary) AS SECOND_HIGHEST_SALARY
FROM EMPLOYE
WHERE Salary < (SELECT MAX(Salary) FROM EMPLOYE);

