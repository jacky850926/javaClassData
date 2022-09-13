select * from room e1 left join reservation e2 on e1.roomID = e2.roomID where e1.amount > 0 and e2.checkInDate

select * from room;

select * from reservation;

select sum(numberOfRoom) from reservation group by roomID