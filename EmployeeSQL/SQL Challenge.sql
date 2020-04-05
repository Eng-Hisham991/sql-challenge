
--1 List the following details of each employee: employee number, last name,
--  first name, gender, and salary. 
create view Question_1 as 
select employees.emp_no, Last_name, First_name, Gender, Salary, hire_date
from employees
inner join salaries on employees.emp_no = salaries.emp_no;

---2 List employees who were hired in 1986.
create view Question_2 as 
select employees.emp_no, Last_name, First_name, Gender, Salary, hire_date
from employees
inner join salaries on employees.emp_no = salaries.emp_no
where hire_date >= '1986-1-1' and hire_date <= '1986-12-31';

---3 List the manager of each department with the following information: department 
---  number, department name, the manager's employee number, last name, first name, and 
---  start and end employment dates.
create view Question_3 as 
select dept_manager.dept_no, dept_name, dept_manager.emp_no, 
employees.last_name, employees.first_name, salaries.from_date, salaries.to_date 
from dept_manager
inner join departments on departments.dept_no = dept_manager.dept_no
inner join employees on dept_manager.emp_no = employees.emp_no
inner join salaries on dept_manager.emp_no = salaries.emp_no;

---4  List the department of each employee with the following information: 
---   employee number, last name, first name, and department name.
create view Question_4 as 
select dept_emp.emp_no, last_name, first_name, departments.dept_name from employees
inner join dept_emp on dept_emp.emp_no = employees.emp_no
inner join departments on departments.dept_no = dept_emp.dept_no;

---5  List all employees whose first name is "Hercules" and last names begin with "B."
create view Question_5 as 
select first_name, last_name from employees
where first_name = 'Hercules' and last_name like 'B%';

---6  List all employees in the Sales department, including their employee number, last 
---   name, first name, and department name.
create view Question_6 as 
select dept_emp.emp_no, last_name, first_name, departments.dept_name from employees
inner join dept_emp on dept_emp.emp_no = employees.emp_no
inner join departments on departments.dept_no = dept_emp.dept_no
where departments.dept_name = 'Sales';

---7  List all employees in the Sales and Development departments, including their 
---   employee number, last name, first name, and department name.
create view Question_7 as 
select dept_emp.emp_no, last_name, first_name, departments.dept_name from employees
inner join dept_emp on dept_emp.emp_no = employees.emp_no
inner join departments on departments.dept_no = dept_emp.dept_no
where departments.dept_name = 'Sales' or departments.dept_name = 'Development';

---8  In descending order, list the frequency count of employee last names, i.e., how 
---   many employees share each last name.
create view Question_8 as 
select last_name, count(last_name) as "The frequency" from employees
group by last_name
order by "The frequency" desc;

