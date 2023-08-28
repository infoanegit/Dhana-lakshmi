select * from publishers
select * from employee
select * from jobs

-- Display/find the total number of Publishers in publishers table.
select count(pub_name) as TotalNoOfPublishers from publishers;

-- Display the employee name and job description of all employees with the same job as Howard.
select CONCAT(fname,'',minit,'',lname) AS Name, job_desc from employee e join 
jobs j ON j.job_id = e.job_id where j.job_id =  (select job_id from employee where fname='Howard')

-- Display the employee name and job description of all employees whose are not Managing Editor.
select CONCAT(fname,'',minit,'',lname) AS Name, job_desc from employee e join 
jobs j ON j.job_id = e.job_id where j.job_desc != 'Managing Editor'