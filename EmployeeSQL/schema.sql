-- Create the titles table, with a primary id and a title
CREATE TABLE titles (
    title_id VARCHAR(50)
    , title VARCHAR(50)
    , PRIMARY KEY (title_id)
);

-- Create an employees table, with the following: 
CREATE TABLE employees (
    emp_no INT
    , employee_title_id INT
    , birth_date INT
    , first_name VARCHAR(50)
    , last_name VARCHAR(50)
    , sex VARCHAR(6)
    , hire_date DATE
    , PRIMARY KEY (emp_no)
    , FOREIGN KEY (employee_title_id) REFERENCES titles(title_id)
);

-- Create an departments table, with the following: 
CREATE TABLE departments (
    dept_no INT
    , dept_name VARCHAR(50)
    , PRIMARY KEY (dept_no)
);

-- Create an dept_manager table, with the following: 
CREATE TABLE dept_manager (
    dept_no VARCHAR(50)
    , emp_no INT
    , PRIMARY KEY (dept_no)
    , FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
    , FOREIGN KEY (emp_no) REFERENCES employees(employee_title_id)
)

-- Create an dept_emp table, with the following: 
CREATE TABLE dept_emp (
    emp_no INT
    , dept_no VARCHAR(50)
    , PRIMARY KEY (emp_no)
    , FOREIGN KEY (emp_no) REFERENCES employees(employee_title_id)
    , FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
)

-- Create an salaries table, with the following: 
CREATE TABLE salaries (
    emp_no INT
    , salary INT
    , PRIMARY KEY (emp_no)
    , FOREIGN KEY (emp_no) REFERENCES employees(employee_title_id)
);
