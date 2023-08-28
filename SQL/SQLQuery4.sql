select * from titles
select * from publishers


-- Display the maximum and minimum price of the book.
select min(price) as min_price, max(price) as max_price from titles


-- Display the total book price for each type.
select type, sum(price) as total_price from titles group by type;


-- Find out the Publisher for the following books 
--    ‘Cooking with Computers: Surreptitious Balance Sheets’, 
--    ‘Silicon Valley Gastronomic Treats’, 
--    ‘Is Anger the Enemy?’, 
--    ‘Fifty Years in Buckingham Palace Kitchens’.
select pub_name as publisher, title as books from publishers p join titles t ON p.pub_id = t.pub_id
where title in ('Cooking with Computers: Surreptitious Balance Sheets', 
				'Silicon Valley Gastronomic Treats', 
				'Is Anger the Enemy?', 
				'Fifty Years in Buckingham Palace Kitchens');