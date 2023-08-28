select * from titles
select * from stores
select * from employee

-- Select the average price in the table titles for  pub _id is 1389.
select avg(price) as [Avg price] from titles where pub_id = '1389'

-- What are the total numbers of rows in the titles table
select count(*) as [Total No Of Rows] from titles

-- List the address of all stores  in the state WA or CA in the table stores
select stor_address, state from stores where state ='WA'

-- List the date between  the year 1989 to 1992 in the table employee
select hire_date from employee where hire_date between '01/01/89' AND '12/31/92'

-- List the first name and last name of the employee in the employee table where the jobs_id  is 6
select fname, lname from employee where job_id = '6'
