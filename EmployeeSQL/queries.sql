-- data analysis

-- 1. select all employees
SELECT
	employees.emp_no,
	employees.last_name,
	employees.first_name,
	employees.sex,
	salaries.salary
FROM
	employees
JOIN
	salaries
  ON
	employees.emp_no = salaries.emp_no;

-- 2. find employees hired in 1986
SELECT
	last_name,
	first_name,
	hire_date
FROM
	employees
WHERE
	hire_date LIKE '%/1986';
	
-- 3. find managers of departments
SELECT
	employees.emp_no,
	employees.last_name,
	employees.first_name,
	departments.dept_no,
	departments.dept_name
FROM
	dept_manager
JOIN
	employees
  ON
	dept_manager.emp_no = employees.emp_no
JOIN
	departments
  ON
	departments.dept_no = dept_manager.dept_no;
	
-- 4. find employee departments
SELECT
	employees.emp_no,
	employees.last_name,
	employees.first_name,
	departments.dept_no,
	departments.dept_name
FROM
	dept_emp
JOIN
	employees
  ON
	employees.emp_no = dept_emp.emp_no
JOIN
	departments
  ON
  	departments.dept_no = dept_emp.dept_no;
	
-- 5. find employees named Hercules B.
SELECT
	last_name,
	first_name,
	sex
FROM
	employees
WHERE
	first_name = 'Hercules'
	AND last_name LIKE 'B%';
	
-- 6. find employees in sales
SELECT
	employees.emp_no,
	employees.last_name,
	employees.first_name,
	departments.dept_name
FROM
	employees
JOIN
	dept_emp
  ON
  	dept_emp.emp_no = employees.emp_no
JOIN
	departments
  ON
  	departments.dept_no = dept_emp.dept_no
WHERE
	departments.dept_name = 'Sales';

-- 7. find employees in sales and development
SELECT
	employees.emp_no,
	employees.last_name,
	employees.first_name,
	departments.dept_name
FROM
	employees
JOIN
	dept_emp
  ON
  	dept_emp.emp_no = employees.emp_no
JOIN
	departments
  ON
  	departments.dept_no = dept_emp.dept_no
WHERE
	departments.dept_name = 'Sales'
	OR departments.dept_name = 'Development';
	
-- 8. list name frequency
SELECT
	COUNT(last_name), last_name
FROM
	employees
GROUP BY last_name
ORDER BY COUNT(last_name) DESC;