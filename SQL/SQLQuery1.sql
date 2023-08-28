-- Write an SQL Query to display all information in the authors table.
select * from authors

--  Display all authors first name and last name who lived in the state ‘UT’.
select au_lname, au_fname from authors where state ='UT';

-- Display the last names of all authors with an `A' in their last name.
Select au_lname FROM authors WHERE au_lname LIKE '%A%';

-- Display all information of an author with phone number is ‘707 448-4982’.
select * from authors where phone = '707 448-4982';