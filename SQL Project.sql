USE employees;
#Displaying the employees table
SELECT * FROM employees;
#Displaying specific columns
SELECT emp_no, first_name, last_name, gender FROM employees;
#Filtering rows by a condition
SELECT emp_no, salary FROM salaries
WHERE salary>60000;
#Filtering rows by and/or
SELECT * FROM employees
WHERE (hire_date>'1990-1-1' AND birth_date>'1960-1-1') OR gender='F';
#Renaming columns
SELECT birth_date as 'Date of birth', first_name as 'First name', last_name as 'Last name'
FROM employees;
#Combining columns with concat
SELECT concat(last_name,', ', first_name) as 'full name'
FROM employees
WHERE gender='M';
#If-else
SELECT first_name, last_name,
CASE WHEN hire_date>'1992-1-1' THEN 'Recent hire'
	 WHEN hire_date<'1987-1-1' THEN 'Long-time employee'
     ELSE 'Established employee'
     END AS 'How long?'
FROM employees;
#First 5 results
SELECT * FROM employees
LIMIT 5;
#Rows matching a particular pattern
SELECT * FROM titles
WHERE title IN ('Staff','Engineer');
#Matching patterns with wildcard operator
SELECT * FROM titles
WHERE title LIKE ('Senior%');
#Sorting by a column
SELECT first_name, last_name, hire_date
FROM employees
ORDER BY hire_date asc;
#Sorting by multiple columns
SELECT first_name, last_name, birth_date
FROM employees
ORDER BY birth_date, hire_date;
#Finding age
SELECT last_name, first_name, datediff(hire_date, birth_date)/365 AS 'Age at hire'
FROM employees
WHERE gender='M';
#Filtering by age
SELECT last_name, first_name, datediff(hire_date, birth_date)/365 AS 'Age at hire'
FROM employees
WHERE datediff(hire_date, birth_date)/365>30;
#Union of 2 tables
SELECT emp_no AS 'union', dept_no
FROM dept_emp
UNION ALL
SELECT dept_name, dept_no
FROM departments;
#Join based on common values
SELECT first_name, last_name, e.emp_no, title
FROM employees AS e, titles AS t
WHERE e.emp_no=t.emp_no;
#Select not in other select
SELECT * FROM employees
WHERE emp_no NOT IN (SELECT emp_no FROM dept_manager);
#Aggregate values
SELECT gender,count(DISTINCT e.emp_no),avg(salary)
FROM employees AS e, salaries AS s
where e.emp_no=s.emp_no
GROUP BY gender;
#Insert rows
INSERT INTO departments(dept_no, dept_name)
VALUES (9999, 'Testing');
#Copy between tables
INSERT INTO dept_manager(emp_no,dept_no,from_date,to_date)
SELECT emp_no,dept_no,from_date,to_date FROM  dept_emp
WHERE emp_no='10001';
#Update records
UPDATE salaries
	SET salary=salary*2
    WHERE from_date<'1986-1-1';
#Delete records
DELETE FROM dept_manager WHERE emp_no='10001';