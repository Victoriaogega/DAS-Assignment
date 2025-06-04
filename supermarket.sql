CREATE schema supermarket;
CREATE TABLE  supermarket.employees_table(
employee_id  INT PRIMARY KEY ,
first_name VARCHAR(100) NOT NULL , 
last_name VARCHAR (100) NOT NULL,
Gender VARCHAR(10) NOT NULL,
Department VARCHAR(100) NOT NULL,
Hire_date DATE NOT NULL,
Salary DECIMAL(7,2) NOT NULL
);

INSERT INTO supermarket.employees_table(employee_id,first_name,last_name,
Gender,Department,Hire_date,Salary)

VALUES 
(1,'John','Doe','male','IT','2018-05-01',60000.00),
(2,'Jane','Smith','female','HR','2019-06-15',50000.00),
(3,'Michael','JOhnson','male','finance','2017-03-10',75000.00),
(4,'Emily','Davis','female','IT','2020-11-20',70000.00),
(5,'Sarah','Brown','female','marketing','2016-07-30',45000.00),
(6,'David','Wilson','male','sales','2019-01-05',55000.00),
(7,'Chris','Taylor','male','IT','2022-02-25',65000.00);

CREATE TABLE supermarket.Products_table(
    product_id INT PRIMARY KEY not null ,
    product_name VARCHAR (100) not null ,
    category VARCHAR (100) not null ,
     price DECIMAL(5,2) not null ,
     stock INT not null 
     );

ALTER TABLE supermarket.Products_table
ALTER COLUMN  price TYPE DECIMAL(10, 2);

     INSERT INTO supermarket.Products_table(product_id,Product_name,category,price,stock)
     VALUES
     (1,'Laptop','Electronics',1200.0,30),
     (2,'Desk','Furniture',300.00,50),
     (3,'Chair','Furniture',150.00,200),
     (4,'Smartphone','Electronics',800.00,75),
     (5,'Monitor','Electronics',250.00,40),
     (6,'Bookshelf','Furniture',100.00,60),
     (7,'Printer','Electronics',200.00,25);
    
CREATE TABLE supermarket.Sales_table(
sales_id INT PRIMARY KEY ,
product_id INT REFERENCES supermarket.Products_table(product_id),
employee_id INT REFERENCES supermarket.employees_table(employee_id),
sale_date DATE  NOT NULL,
quantity INT  NOT NULL,
total DECIMAL (7,2)
);

INSERT INTO supermarket.Sales_table(
  sales_id,product_id,employee_id,sale_date,quantity ,total
)
VALUES
(1,1,1,'2021-01-15',2,2400.00),
(2,2,2,'2021-03-22',1,300.00),
(3,3,3,'2021-05-10',4,600.00),
(4,4,4,'2021-07-18',3,2400.00),
(5,5,5,'2021-09-25',2,500.00),
(6,6,6,'2021-11-30',1,100.00),
(7,7,1,'2022-02-15',1,200.00),
(8,1,2,'2022-04-10',1,1200.00),
(9,2,3,'2022-06-20',2,600.00),
(10,3,4,'2022-08-05',3,450.00),
(11,4,5,'2022-10-11',1,800.00),
(12,5,6,'2022-12-29',4,1000.00);



SELECT * 
FROM supermarket.employees_table   employee_details;





SELECT first_name AS name
FROM supermarket.employees_table ;


SELECT DISTINCT department
FROM supermarket.employees_table;


 
SELECT count(employee_id) AS total_employees
FROM supermarket.employees_table;




SELECT sum(Salary) AS total_salary
FROM supermarket.employees_table;






SELECT avg(Salary)  AS avg_sal
FROM supermarket.employees_table  employees;




SELECT max(salary) AS max_salary
FROM supermarket.employees_table   employees;



SELECT min(salary) AS min_salary
FROM supermarket.employees_table     employees;



SELECT sum(Employee_id) AS total_male_employees
FROM supermarket.employees_table  employees
WHERE Gender ='male';

SELECT sum(employee_id) AS female_employees
FROM supermarket.employees_table   employees
WHERE Gender ='female' ;


SELECT SUM(employee_id)
FROM supermarket.employees_table    employees
WHERE extract(YEAR FROM Hire_date) = 2020;



SELECT avg(Salary)  AS avg_salary
FROM supermarket.employees_table   employees
WHERE Department = 'IT';


SELECT  department, sum(Employee_id) AS total_employees
FROM supermarket.employees_table   employee
GROUP BY Department


SELECT Department AS dep, sum(Salary) AS Total_salary
FROM supermarket.employees_table     employees
GROUP BY Department;



SELECT Department AS dep, max(Salary) AS max_salary
FROM supermarket.employees_table  employee_details
GROUP BY Department;


SELECT Department AS dep, min(Salary) AS min_salary
FROM supermarket.employees_table  employee_details
GROUP BY Department;


SELECT count(Gender) AS gender_number
FROM supermarket.employees_table
GROUP BY Gender;


SELECT Gender, avg(Salary) AS avg_salary
FROM supermarket.employees_table  employee_dets
GROUP BY Gender;



SELECT *
FROM supermarket.employees_table   employee_det
ORDER BY salary DESC
limit 5;



SELECT count(DISTINCT First_name) AS unique_name
FROM supermarket.employees_table;


SELECT e.employee_id, s.quantity
FROM supermarket.employees_table e
INNER JOIN supermarket.Sales_table s
ON e.Employee_id = s.Employee_id;



SELECT *
FROM supermarket.employees_table emp
ORDER BY Hire_date ASC
limit 10;




SELECT First_name AS f_name
FROM  supermarket.employees_table
WHERE Employee_id NOT IN (SELECT Employee_id from supermarket.Sales_table);




SELECT e.first_name, SUM(s.quantity) AS total_sales 
FROM supermarket.employees_table e
INNER JOIN supermarket.sales_table s 
 ON e.employee_id = s.employee_id
GROUP BY e.employee_id;




 
SELECT e.first_name, SUM(s.quantity) AS total_sales
FROM supermarket.employees_table e
JOIN supermarket.sales_table  s 
ON e.employee_id = s.employee_id
GROUP BY e.employee_id
ORDER BY total_sales DESC
LIMIT 1;




SELECT e.department, AVG(s.quantity)
FROM supermarket.employees_table e
JOIN supermarket.sales_table  s 
ON e.employee_id = s.employee_id
GROUP BY e.department




SELECT e.first_name, SUM(s.quantity)
FROM supermarket.employees_table e
JOIN supermarket.sales_table  s 
ON e.employee_id = s.employee_id
WHERE extract(YEAR FROM s.sale_date) = 2021
GROUP BY e.first_name;



SELECT e.first_name, SUM(s.quantity) AS total_sales
FROM supermarket.employees_table e
JOIN supermarket.sales_table  s 
ON  e.employee_id = s.employee_id
GROUP BY e.first_name
ORDER BY total_sales DESC
LIMIT 3;


SELECT e.department, SUM(s.quantity) AS total_sales
FROM  supermarket.employees_table e
JOIN supermarket.sales_table  s
ON  e.employee_id = s.employee_id
GROUP BY e.department;

--   30. Select the total revenue generated by sales of products in each category.
SELECT pr.product_name, SUM(pr.price* s.quantity) AS total_revenue
FROM supermarket.Products_table pr
JOIN  supermarket.sales_table  s
ON  pr.product_id = s.product_id
GROUP BY pr.product_name;


