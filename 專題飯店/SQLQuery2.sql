select * from room e1 left join reservation e2 on e1.roomID = e2.roomID where e1.amount > 0 and e2.checkInDate

select * from hotel;

select * from roomStyle;

select * from room;

select * from reservation;

select * from roomstyle;

select sum(numberOfRoom) from reservation group by roomID

select *,'2022-09-11' checkInDate,'2022-09-12' checkOutDate from room cross join roomstyle;

select roomID,'2022-09-11' checkInDate,'2022-09-12' checkOutDate from room;

select reservationID,roomID,checkInDate,checkOutDate from reservation where checkInDate in ('2022-09-11','2022-09-12') or checkoutdate in ('2022-09-11','2022-09-12');

select roomID,'2022-09-11' checkInDate,'2022-09-12' checkOutDate from room where roomID not in ((select roomID from reservation where checkInDate in ('2022-09-11','2022-09-12') or checkoutdate in ('2022-09-11','2022-09-12')));

select * from room where roomID not in  ((select roomID from reservation where checkInDate in ('2022-09-11','2022-09-12') or checkoutdate in ('2022-09-11','2022-09-12')))
--目的應該是抓出有房間的飯店名字
select * from (select * from room where roomID not in  (select roomID from reservation where checkInDate between '2022-09-12' and '2022-09-14' or checkoutdate between '2022-09-12' and '2022-09-14')) as a join roomstyle as b on a.roomStyleID = b.styleID order by hotelID

select roomID from reservation where checkInDate between '2022-09-12' and '2022-09-14' or checkoutdate between '2022-09-12' and '2022-09-14'

select * from room e1 join reservation e2 on e1.roomID  = e2.roomID


select c.hotelID,c.name,c.address,c.averagePrice,count(*) amount from (select * from room where roomID not in  (select roomID from reservation where checkInDate between '2022-10-11' and '2022-10-12' or checkoutdate between '2022-10-11' and '2022-10-14')) as a JOIN roomstyle as b on a.roomStyleID = b.styleID JOIN hotel as c on b.hotelID = c.hotelID where c.country = '台灣' and b.capacity > 2 group by c.hotelID,c.name,c.address,c.averagePrice