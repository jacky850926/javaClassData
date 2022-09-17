use springdemo;

create table PurchaseOrder(
	oid int not null primary key identity(1000,1),
	amount int not null,
	odate date not null,
	userid int not null,
	pid int not null
);

select * from PurchaseOrder;