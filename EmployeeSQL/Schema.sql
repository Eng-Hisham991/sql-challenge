-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/3NOehC
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- Modify this code to update the DB schema diagram.
-- To reset the sample schema, replace everything with
-- two dots ('..' - without quotes).

CREATE TABLE Departments (
    Dept_no varchar   NOT NULL,
    Dept_name varchar   NOT NULL,
    CONSTRAINT pk_Departments PRIMARY KEY (
        Dept_no
     )
);

CREATE TABLE Dept_manager (
    Dept_no varchar   NOT NULL,
    Emp_no int   NOT NULL,
    From_date date   NOT NULL,
    To_date date   NOT NULL,
    CONSTRAINT pk_Dept_manager PRIMARY KEY (
        Dept_no, Emp_no
     )
);

CREATE TABLE Dept_emp (
    Emp_no int   NOT NULL,
    Dept_no varchar   NOT NULL,
    From_date date   NOT NULL,
    To_date date   NOT NULL,
    CONSTRAINT pk_Dept_emp PRIMARY KEY (
        Emp_no, Dept_no
     )
);

CREATE TABLE Employees (
    Emp_no int   NOT NULL,
    Birth_date date   NOT NULL,
    First_name varchar   NOT NULL,
    Last_name varchar   NOT NULL,
    Gender varchar   NOT NULL,
    Hire_date date   NOT NULL,
    CONSTRAINT pk_Employees PRIMARY KEY (
        Emp_no
     )
);

CREATE TABLE Salaries (
    Emp_no int   NOT NULL,
    Salary integer   NOT NULL,
    From_date date   NOT NULL,
    To_date date   NOT NULL,
    CONSTRAINT pk_Salaries PRIMARY KEY (
        Emp_no
     )
);

CREATE TABLE Titles (
    Emp_no Int   NOT NULL,
    Title varchar   NOT NULL,
    From_date date   NOT NULL,
    To_date date   NOT NULL,
    CONSTRAINT pk_Titles PRIMARY KEY (
        Emp_no, Title, From_date
     )
);

ALTER TABLE Dept_manager ADD CONSTRAINT fk_Dept_manager_Dept_no FOREIGN KEY(Dept_no)
REFERENCES Departments (Dept_no);

ALTER TABLE Dept_manager ADD CONSTRAINT fk_Dept_manager_Emp_no FOREIGN KEY(Emp_no)
REFERENCES Employees (Emp_no);

ALTER TABLE Dept_emp ADD CONSTRAINT fk_Dept_emp_Emp_no FOREIGN KEY(Emp_no)
REFERENCES Employees (Emp_no);

ALTER TABLE Dept_emp ADD CONSTRAINT fk_Dept_emp_Dept_no FOREIGN KEY(Dept_no)
REFERENCES Departments (Dept_no);

ALTER TABLE Salaries ADD CONSTRAINT fk_Salaries_Emp_no FOREIGN KEY(Emp_no)
REFERENCES Employees (Emp_no);

ALTER TABLE Titles ADD CONSTRAINT fk_Titles_Emp_no FOREIGN KEY(Emp_no)
REFERENCES Employees (Emp_no);

