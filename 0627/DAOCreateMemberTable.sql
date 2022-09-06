create table member(
id int primary key not null,
member_name nvarchar(50) not null,
member_address nvarchar(100),
phone nvarchar(20)
);

select * from member;