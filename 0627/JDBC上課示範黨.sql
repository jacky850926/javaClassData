create table users(
id int not null primary key identity(1,1),
username varchar(50) not null,
pwd varchar(50) not null
);

insert into users(username,pwd)
values('','666')

select * from users where username = '' or 1=1 --jerry' and pwd = '666';
select * from users where username = ''or 1=1--' and pwd = '666'

create procedure productProc(@proId int , @proName varchar(50)out)
as
select @proname=productname from product where productid = @proId

declare @myName varchar(50)
exec productProc 1002, @myName out
print @myName

create procedure productProc2(@proId int)
as
select productname from product where productid = @proId;

exec productPro2 1003;

create table gallery(
id int primary key identity(1,1),
image_name nvarchar(50),
image_file varbinary(max)
);

select * from gallery

create table coupon(
id int primary key identity(1,1),
userEmail varchar(100),
couponCode varchar(100)
);

select * from coupon