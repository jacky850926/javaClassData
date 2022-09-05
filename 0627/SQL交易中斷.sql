create table accounts(
 id int primary key identity(1,1),
 username varchar(50),
 balance bigint
);

insert into accounts(username, balance)
values
('Amy', 10000),('Bill', 500);

select * from accounts;

begin transaction;

update accounts set balance = balance - 500 where id = 1;
update accounts set balance = balance + 500 where id = 2;

select * from accounts;
