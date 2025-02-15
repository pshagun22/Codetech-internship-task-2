-- Task 2: Advanced Queries

-- Window Function Example: Rank Employees by Salary
SELECT Name, DepartmentID, Salary,
RANK() OVER (PARTITION BY DepartmentID ORDER BY Salary DESC) AS Rank
FROM Employees;

-- Subquery Example: Employees with Above-Average Salary
SELECT Name, Salary FROM Employees
WHERE Salary > (SELECT AVG(Salary) FROM Employees);

-- CTE Example: Extracting IT Department Employees
WITH IT_Employees AS (
    SELECT * FROM Employees WHERE DepartmentID = (SELECT DepartmentID FROM Departments WHERE DepartmentName = 'IT')
)
SELECT * FROM IT_Employees;
