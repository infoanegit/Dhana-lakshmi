create table students (
    Id int IDENTITY(1,1) PRIMARY KEY,
	Name varchar(50),
	Email varchar(100)
	);

select * from students;

drop table students;
