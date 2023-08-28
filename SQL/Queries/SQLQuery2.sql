select * from employee
select * from jobs


-- Display the names and hire dates of  employees hired between 1991 - 1992.
select fname, lname from employee where hire_date between '01/01/91' AND '12/31/92'

-- Display the names of employees without middle (minit) name.
select fname, lname from employee where minit = ' ';

-- Display the names and hire dates of all employees with the column 
-- headers \Name" and \Start Date", in the order they were hired.
select fname, lname, hire_date from employee order by hire_date;

-- Retrieve the names of  employees whose designation is ‘Sales Representative’.
select jobs.job_desc, employee.fname, employee.lname from jobs INNER JOIN employee ON jobs.job_id = employee.job_id 
where job_desc= 'Sales Representative';
