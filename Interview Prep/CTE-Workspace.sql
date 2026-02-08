-- creating table
CREATE TABLE employees (
	id INTEGER PRIMARY KEY,
	name TEXT,
	department TEXT,
	manager_id INTEGER,
	salary NUMERIC(10,2),
	hire_date DATE
);
INSERT INTO employees (id, name, department, manager_id, salary, hire_date) VALUES
(1, 'Alice', 'HR', NULL, 70000, '2015-06-23'),
(2, 'Bob', 'IT', 1, 90000, '2016-09-17'),
(3, 'Charlie', 'Finance', 1, 80000, '2017-02-01'),
(4, 'David', 'IT', 2, 75000, '2018-07-11'),
(5, 'Eve', 'Finance', 3, 72000, '2019-04-30');
WITH AvgSalaryByDept AS (
    SELECT Department, AVG(Salary) AS AvgSalary
    FROM Employees
    GROUP BY Department
)
SELECT *
FROM employees;

-- %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% --
-- Q.1 How do you retrieve employees and their hierarchical managers recursively?
WITH RECURSIVE EmployeesHierarchy AS(
	SELECT id, name, manager_id, 1 AS level
	FROM employees WHERE manager_id IS NULL
	UNION ALL
	SELECT e.id, e.name, e.manager_id, eh.level + 1
	FROM employees e JOIN EmployeesHierarchy eh ON e.manager_id = eh.id
)	
SELECT * FROM EmployeesHierarchy ORDER BY level;

-- Q.2 How do you calculate the number of levels in an organizational hierarchy?
WITH Recursive Hierarchy AS (
	SELECT id, name, manager_id, 1 AS level 
	FROM employees WHERE manager_id IS NULL
	UNION ALL
	SELECT e.id, e.name, e.manager_id, h.level + 1
	FROM employees e JOIN Hierarchy h ON e.manager_id=h.id
)
SELECT MAX(level) AS max_levels FROM Hierarchy;
-- Q.3 How can you calculate cumulative salary within each department?
WITH Recursive RunningSalary AS (
	SELECT department, name, salary,
	SUM(salary) OVER (PARTITION BY department ORDER BY hire_date) AS running_total
	FROM employees
)
SELECT * FROM RunningSalary;

-- Q.4 How do you find most recent hire in each department ? 
WITH Recursive RecentHire AS(
	SELECT  name,department, 
	DENSE_RANK () OVER(PARTITION BY department ORDER BY hire_date Desc) rank
	FROM employees
)
SELECT * FROM RecentHire WHERE rank = 1