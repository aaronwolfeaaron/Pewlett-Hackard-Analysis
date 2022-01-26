-- Challenge

-- DELIVERABLE #1

-- 1. Retrieve the emp_no, first_name, and last_name columns from the Employees table.
SELECT e.emp_no, e.first_name, e.last_name,

-- 2. Retrieve the title, from_date, and to_date columns from the Titles table.
ti.title, ti.from_date, ti.to_date

-- 3. Create a new table using the INTO clause.
INTO retirement_titles
FROM employees as e

-- 4. Join both tables on the primary key.
	JOIN titles as ti
	ON e.emp_no = ti.emp_no

-- 5. Filter the data on the birth_date column to retrieve the employees who were born between 1952 and 1955. 
-- Then, order by the employee number.
	WHERE e.birth_date BETWEEN '1952-01-01' AND '1955-12-31'
	ORDER BY e.emp_no
	
DROP TABLE retirement_titles

SELECT * FROM retirement_titles

-- Retrieve the employee number, first and last name, and title columns from the Retirement Titles table.
-- These columns will be in the new table that will hold the most recent title of each employee.
-- Use the DISTINCT ON statement to retrieve the first occurrence of the employee number 
-- for each set of rows defined by the ON () clause.

DROP TABLE unique_titles

SELECT DISTINCT ON (emp_no) emp_no,
	first_name,
	last_name,
	title,
	to_date
INTO unique_titles
FROM retirement_titles
ORDER BY emp_no ASC, to_date DESC;

SELECT * FROM unique_titles

-- Exclude those employees that have already left the company 
-- by filtering on to_date to keep only those dates that
-- are equal to '9999-01-01'.

SELECT * FROM unique_titles
WHERE to_date = '9999-01-01';

-- Create a Unique Titles table using the INTO clause.

DROP TABLE retiring_titles

SELECT COUNT(title), title
INTO retiring_titles
FROM current_titles
GROUP BY title
ORDER BY COUNT(title) DESC

SELECT * FROM retiring_titles

-- DELIVERABLE #2

SELECT * FROM employees
SELECT * FROM dept_emp
SELECT * FROM titles

SELECT DISTINCT ON (e.emp_no) e.emp_no,
 e.first_name,
 e.last_name,
 e.birth_date,
 de.from_date,
 de.to_date,
 ti.title
INTO mentors
FROM employees as e
INNER JOIN dept_emp as de
 ON (e.emp_no = de.emp_no)
INNER JOIN titles as ti
 ON (e.emp_no = ti.emp_no)
WHERE (de.to_date = '9999-01-01')
AND (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY e.emp_no;

DROP TABLE mentors

SELECT * FROM mentors