use springDemo;

create table Product(
	pid int not null primary key identity(10000,1),
	pname nvarchar(50) not null,
	price int not null,
	quantity int not null,
	pdate date not null,
	note nvarchar(200) not null
);

insert into Product(pname,price,quantity,pdate,note) values('banana',20,6,'2022-03-15',N'�W�n�Y');
insert into Product(pname,price,quantity,pdate,note) values('apple',40,10,'2022-04-25',N'�W���Y');
insert into Product(pname,price,quantity,pdate,note) values('grape',90,3,'2022-05-10',N'�n�Y');
insert into Product(pname,price,quantity,pdate,note) values('pineapple',50,7,'2022-07-03',N'�L');
insert into Product(pname,price,quantity,pdate,note) values('jackfruit',499,2,'2022-09-27',N'�W��');
insert into Product(pname,price,quantity,pdate,note) values('durian',699,3,'2022-06-30',N'��');
insert into Product(pname,price,quantity,pdate,note) values('lichi',10,20,'2022-01-01',N'��Y');

select * from product