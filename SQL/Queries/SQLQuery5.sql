select * from authors
select * from employee
select * from titles


-- Display/find the given authors complete address information. [Panteley Sylvia]
select concat(address,' ', city,' ', state,' ', zip) as [Complete Address] from authors
where concat(au_lname,' ',au_fname) ='Panteley Sylvia'

-- Display only the hire date and employee name for each employee.
select concat(fname,' ', minit, ' ', lname) as name, hire_date from employee 

-- Display all the books which come under ‘Psychology’ type.
select title from titles where type = 'Psychology'