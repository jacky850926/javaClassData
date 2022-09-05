create table tabletest(
id int primary key,
classNumber int,
className varchar(max),
classOfMailbox int,
mailboxName varchar(max),
address varchar(max),
descripAddress varchar(max),
mechanism varchar(max),
phoneNumber Varchar(max),
remark varchar(max),
longitude float,
latitude float
);

select * from tabletest

select top 10 * from tabletest order by id

select * from tabletest where id like '%2%';

select * from tabletest where id between 27960 and 34950

drop table tabletest

delete from tabletest where address = '新竹縣五峰鄉花園村花園102號';

select * from tabletest as a for json path;

select id as id, classnumber as '類別' ,classname clossofmailbox ,
mailboxname 
from tabletest for json path

select * from tabletest for xml path