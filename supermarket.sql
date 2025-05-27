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

VALUES (1,'John','Doe','male','IT','2018-05-01',60000.00),
(2,'Jane','Smith','female','HR','2019-06-15',50000.00),
(3,'Michael','JOhnson','male','finance','2017-03-10',75000.00),
(4,'Emily','Davis','female','IT','2020-11-20',70000.00),
(5,'Sarah','Brown','female','marketing','2016-07-30',45000.00),
(6,'David','Wilson','male','sales','2019-01-05',55000.00),
(7,'Chris','Taylor','male','IT','2022-02-25',65000.00);

CREATE TABLE supermarket.Products_table(
    product_id INT primary key not null ,
    product_name VARCHAR (100) not null ,
    category VARCHAR (100) not null ,
     price DECIMAL(4,2) not null ,
     stock INT not null 
     );

     INSERT INTO supermarket.Products_table(product_id,Product_name,category,price,stock)
     VALUES (1,'Laptop','Electronics',1200.00,30),
     (2,'Desk','Furniture',300.00,50),
     (3,'Chair','Furniture',',150.00,200),
     (4,'Smartphone','Electronics',800.00,75),
     (5,'Monitor','Electronics',250.00,40),
     (6,'Bookshelf','Furniture'',100.00,60),
     (7,'Printer','Electronics',200.00,25);
    
CREATE TABLE supermarket.Sales_table(
    sales_id INT PRIMARY KEY ,
    product_id INT REFERENCES supemarket.Products_Table(ProductID),
Employee_id INT REFERENCES supermarket.Employee_Table(EmployeeID),
sale_date DATE  NOT NULL,
quantity INT  NOT NULL,
total DECIMAL (7,2)
);

INSERT INTO supermarket.Sales_table(
  sales_id,  product_id, Employee_id,sale_date,quantity ,total
)
VALUES (1,1,1,'2021-01-15',2,2400.00),
(1,1,1,'2021-03-22',1,300.00),
(2,2,2,'2021-05-10',4,600.00),
(3,3,3,'2021-07-18',3,2400.00),
(4,4,4,'2021-09-25',2,500.00),
(5,5,5,'2021-11-30',2,2400.00),
(6,6,6,'2022-11-30',1,100.00),
(7,7,1,'2022-02-15',1,200.00),
(8,1,2,'2022-04-10',1,1200.00),
(9,2,3,'2022-06-20',2,600.00),
(10,3,4,'2022-08-05',3,450.00),
(11,4,5,'2022-10-11',1,800.00),
(12,5,6,'2022-12-29',4,1000.00);


-- 1. Select all columns from the Employees table. 
SELECT * 
FROM supermarket.employees_table   employee_details;



-- 2. Select the first names of all employees. 

SELECT firt_name AS name
FROM supermarket.employees_table ;

-- 3. Select distinct departments from the Employees table. 
SELECT Department
WHERE 


-- 4. Select the total number of employees. 
SELECT count(Employee_id) AS total_employees
FROM supermarket.employee_table;



-- 5. Select the total salary paid to all employees. 
SELECT sum(Salary) AS total_salary
FROM supermarket.employees_table;




-- 6. Select the average salary of all employees. 

SELECT avg(Salary)  AS avg_sal
FROM supermarket.employees_table  employees;


-- 7. Select the highest salary in the Employees table.

SELECT max(salary) AS max_salary
FROM supermarket.employees_table   employees;


-- 8. Select the lowest salary in the Employees table. 
SELECT min(salary) AS min_salary
FROM supermarket.employees _table     employees;

-- 9. Select the total number of male employees. 

SELECT sum(Employee_id) AS total_male_employees
FROM supermarket.employees_table  employees
GROUP BY 'Gender'
WHERE Gender = 'male';
-- 10. Select the total number of female employees. 
SELECT sum(Employee_id) AS female_employees
FROM supermarket.employees_table   employees
GROUP BY 'Gender'
WHERE Gender = 'female';

-- 11. Select the total number of employees hired in the year 2020. 
SELECT *
FROM supermarket.employees_table    employees
WHERE extract(YEAR FROM Hire_date = 2020);

-- 12. Select the average salary of employees in the 'IT' department. 1

SELECT avg(Salary)  AS avg_salary
FROM supermarket.employees_table   employees
WHERE Department = 'IT';

-- 13. Select the number of employees in each department.
SELECT sum(Employee_id) AS total_employees
FROM supermarket.employees_id   employee
GROUP BY Department

-- 14. Select the total salary paid to employees in each department. 
SELECT Department AS dep, sum(Salary) AS Total_salary
FROM supermarket.employees_table     employees
GROUP BY Department;

-- 15. Select the maximum salary in each department. 

SELECT Department AS dep, max(Salary) AS max_salary
FROM supermarket.employees_table  employee_details
GROUP BY Department;

-- 16. Select the minimum salary in each department. 
SELECT Department AS dep, min(Salary) AS min_salary
FROM supermarket.employees_table  employee_details
GROUP BY Department;

-- 17. Select the total number of employees, grouped by gender.
SELECT count(Gender) AS gender_number
FROM supermarket.employees_table
GROUP BY Gender;

-- 18. Select the average salary of employees, grouped by gender.

SELECT Gender, avg(Salary) AS avg_salary
FROM supermarket.employees_table  employee_dets
GROUP BY Gender;

-- 19. Select the top 5 highest-paid employees. 

SELECT *
FROM supermarket.employees_table   employee_det
ORDER BY salary DESC
limit 5;


-- 20. Select the total number of unique first names in the Employees table. 
SELECT count(DISTINCT First_name) AS unique_name
FROM supermarket.employees_table;

-- 21. Select all employees and their corresponding sales 
SELECT *
FROM supermarket.employees_table emp, supermarket.Sales_table sales
WHERE emp.Employee_id = sales.Employee_id;


-- 22. Select the first 10 employees hired, ordered by their HireDate.
SELECT *
FROM supermarket.employee_table  employee_dets
ORDER BY Hire_date ASC
limit 10;


-- 23. Select the employees who have not made any sales. 

SELECT First_name AS f_name
FROM supermarket.employee_table 
WHERE Employee_id NOT IN (SELECT Employee_id from supermarket.Sales_table);

-- 24. Select the total number of sales made by each employee. 
SELECT Employee_id, First_name, Department,COUNT(Employee_id) AS  total_sales
FROM supermarket.employee_table emp, supermarket.Sales_table 
WHERE emp.Employee_id = sale.Employee_id
GROUP BY emp.Employee_id, First_name;

 
-- 25. Select the employee who made the highest total sales. 


-- 26. Select the average quantity of products sold by employees in each department.

--  27. Select the total sales made by each employee in the year 2021. 
 
--  28. Select the top 3 employees with the most sales in terms of quantity.
 
--   29. Select the total quantity of products sold by each department. 
  
--   30. Select the total revenue generated by sales of products in each category.
