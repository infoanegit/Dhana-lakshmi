create table todo(
id int identity(1,1) primary key,
notes varchar(500),
isactive bit,
created_date datetime,
updated_date datetime
);

select * from todo

drop table todo

TRUNCATE TABLE todo

select * from todo where isactive !=1

