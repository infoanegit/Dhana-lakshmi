create table userlogin (
	Id int IDENTITY(1,1) PRIMARY KEY,
	Username varchar(50) NOT NULL,
	Password varchar(50) NOT NULL
);

select * from userlogin;

drop table userlogin;