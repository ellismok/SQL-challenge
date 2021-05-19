-- Select the employee number, last name, first name, sex, and salary of all employees, ordered by employee number
SELECT 
    employees.emp_no
    , employees.last_name
    , employees.first_name
    , employees.sex
    , salaries.salary
FROM 
    employees
JOIN salaries ON
    employees.emp_no = salaries.emp_no 
ORDER BY 
    employees.emp_no ASC;

-- Select the first name, last name, and hiring date for all employees hired in 1986 
SELECT 
    employees.first_name
    , employees.last_name
    , employees.hire_date
FROM 
    employees
WHERE
    employees.hire_date
    between "1986-01-01" and "1986-12-31";


-- Select the department number, department name, employee number, last name, and first name of all managers of each department
    -- first combine departments DB to dept_emp DB, then combine that table to employees DB
SELECT 
    dept_manager.dept_no
    , departments.dept_name
    , employees.last_name
    , employees.first_name
    , employees.emp_no
FROM 
    dept_manager
JOIN departments ON
    dept_manager.dept_no = departments.dept_no
JOIN employees ON 
    employees.emp_no = dept_manager.emp_no;

-- Select the employee number, last name, first name, and department of each employee, ordered by employee number
SELECT
    dept_emp.emp_no
    , employees.last_name
    , employees.first_name
    , departments.dept_name
FROM 
    dept_emp
JOIN employees ON
    dept_emp.emp_no = employees.emp_no
JOIN departments ON 
    departments.dept_no = dept_emp.dept_no
ORDER BY employees.emp_no;

-- Select first name, last name, birth date, and sex of all employees whose first name is "Hercules" and last name begins with a "B"
SELECT 
    employees.first_name, employees.last_name, employees.birth_date, employees.sex
FROM 
    employees
WHERE 
    employees.first_name = "Hercules" 
    OR
    employees.last_name = "B"; -- contains the word B in the beginning

-- Select employee number, last name, first name, and department name of all employees in the Sales department, ordered by employee number
SELECT
    employees.emp_no
    , employees.last_name
    , employees.first_name
    , departments.dept_name
FROM
    employees
JOIN dept_emp ON
    dept_emp.emp_no = employees.emp_no
JOIN departments ON 
    departments.dept_no = dept_emp.dept_no
WHERE
    departments.dept_name = "Sales"
ORDER BY
    employees.emp_no ASC;


-- Select employee number, last name, first name, and department name of all employees in the 'Sales' OR the 'Development' department, ordered by employee number
SELECT 
    employees.emp_no
    , employees.last_name
    , employees.first_name
    , departments.dept_name
FROM
    employees
JOIN dept_emp ON
    dept_emp.emp_no = employees.emp_no
JOIN departments ON 
    departments.dept_no = dept_emp.dept_no
WHERE 
    departments.dept_name IN ("Sales", "Development")
ORDER BY
    employees.emp_no ASC;

-- Count the number of employees, grouped by last name
SELECT
    employees.last_name
    , COUNT(employees.employee_title_id)
FROM 
    employees
GROUP BY
    employees.last_name;
