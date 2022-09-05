create table member(
id int primary key not null,
member_name nvarchar(50) not null,
member_address nvarchar(100),
phone nvarchar(20)
);

select * from member;

create table ETF_V(
 id int primary key identity(1,1),
 stock_id varchar(20),
 stock_name nvarchar(100),
 month_quantity int
);

select * from etf_v