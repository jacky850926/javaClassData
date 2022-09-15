select * from room e1 left join reservation e2 on e1.roomID = e2.roomID where e1.amount > 0 and e2.checkInDate


select * from roomStyle;

select * from room;

select * from reservation;

select sum(numberOfRoom) from reservation group by roomID

select * from room e1 cross join reservation e2 cross join roomstyle e3 

select * from room e1 join reservation e2 on e1.roomID = e2.roomID join roomstyle e3 on e1.roomstyleID = e3.styleID

select * from room e1 right join reservation e2 on e1.roomID = e2.roomID where checkindate not in ('2022-09-11')


select * from room e1 left join reservation e2 on e1.roomID = e2.roomID where e2.checkindate in ('2022-09-11')

select * from room e1 left join reservation e2 on e1.roomID = e2.roomID where checkindate not in ('2022-09-11')

select * from room e1 left join reservation e2 on e1.roomID = e2.roomID where checkindate between '2022-09-11' and '2022-09-13' 
