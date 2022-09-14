select * from room e1 left join reservation e2 on e1.roomID = e2.roomID where e1.amount > 0 and e2.checkInDate

select * from room;

select * from reservation;

select * from roomstyle;

select sum(numberOfRoom) from reservation group by roomID

select *,'2022-09-11' checkInDate,'2022-09-12' checkOutDate from room cross join roomstyle;

select roomID,'2022-09-11' checkInDate,'2022-09-12' checkOutDate from room;

select reservationID,roomID,checkInDate,checkOutDate from reservation where checkInDate in ('2022-09-11','2022-09-12') or checkoutdate in ('2022-09-11','2022-09-12');

select roomID,'2022-09-11' checkInDate,'2022-09-12' checkOutDate from room where roomID not in ((select roomID from reservation where checkInDate in ('2022-09-11','2022-09-12') or checkoutdate in ('2022-09-11','2022-09-12')));

select * from room where roomID not in  ((select roomID from reservation where checkInDate in ('2022-09-11','2022-09-12') or checkoutdate in ('2022-09-11','2022-09-12')))

select * from room where roomID not in  (select roomID from reservation where checkInDate between '2022-09-12' and '2022-09-14' or checkoutdate between '2022-09-12' and '2022-09-14')

select roomID from reservation where checkInDate between '2022-09-12' and '2022-09-14' or checkoutdate between '2022-09-12' and '2022-09-14'

select * from room e1 join reservation e2 on e1.roomID  = e2.roomID