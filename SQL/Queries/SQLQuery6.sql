select * from titles
select * from publishers


-- Find the total number of books in ‘Business’ type.
select count(title) as [Total No Of books] from titles where type = 'business'

-- Display the published date for this book ‘Life Without Fear’.
select title, pubdate from titles where title = 'Life Without Fear'

-- Display all the books title published by ‘Binnet & Hardley’
select title, pub_name from titles t join publishers p ON t.pub_id = p.pub_id where pub_name = 'Binnet & Hardley'

-- Find the authors first name and last name for this book ‘Straight Talk About Computers’.
select pub_name as [Author Name], title as [Book] from publishers p join titles t ON p.pub_id = t.pub_id  where title = 'Straight Talk About Computers'
