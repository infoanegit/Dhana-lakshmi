create table student (
    Id int IDENTITY(1,1) PRIMARY KEY,
	Firstname varchar(50),
	Lastname varchar(50),
	Email varchar(100),
	Age int,
	gender varchar(20)
	);

select * from student;

drop table student;
