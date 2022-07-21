Employee_Database_challenge.sql
-- Employee Database Challenge 
SELECT employees.emp_no,
employees.first_name,
employees.last_name, 
titles.title, 
titles.from_date,
titles.to_date
INTO retirement_titles
FROM employees
INNER JOIN titles
ON (employees.emp_no = titles.emp_no)
WHERE (employees.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER by employees.emp_no ASC;

-- Verify table created 
SELECT * FROM retirement_titles;

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (retirement_titles.emp_no) retirement_titles.emp_no,
retirement_titles.first_name,
retirement_titles.last_name,
retirement_titles.title

INTO updated_titles
FROM retirement_titles
ORDER BY retirement_titles.emp_no ASC, retirement_titles.to_date DESC;

SELECT * FROM updated_titles;

--Creating new table retiring titles 
SELECT Count(updated_titles.title), updated_titles.title 
INTO retiring_titles
FROM updated_titles 
GROUP BY updated_titles.title
ORDER BY COUNT(updated_titles.title) DESC;

SELECT * FROM retiring_titles;

-- Deliverable 2 The employee mentorship program 

SELECT DISTINCT ON (employees.emp_no) employees.emp_no,
employees.first_name,
employees.last_name,
employees.birth_date,
dept_emp.from_date, 
dept_emp.to_date,
titles.title 
INTO mentorshi_eligibility
FROM employees
INNER JOIN dept_emp
ON (employees.emp_no = dept_emp.emp_no)
INNER JOIN titles 
ON (employees.emp_no = titles.emp_no)
WHERE (birth_date BETWEEN '1965-01-01' AND '1965-12-31')
AND (titles.to_date = '9999-01-01')
AND (dept_emp.to_date = '9999-01-01')
ORDER BY employees.emp_no ASC, dept_emp.from_date DESC;

SELECT * FROM mentorshi_eligibility;

