create table page (
	Id int IDENTITY(1,1) PRIMARY KEY,
	pagename varchar(50),
	description varchar(500)
	);

	select * from page;

	insert into page values('muthu','admin');
	insert into page values('senthil','editor');
	insert into page values('dhana','user');

	drop table page;