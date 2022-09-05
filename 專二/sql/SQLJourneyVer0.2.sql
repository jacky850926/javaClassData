-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2022-07-28 06:08:43.961

--membership
CREATE TABLE membership (
    memberID int  NOT NULL,
	CONSTRAINT membership_pk PRIMARY KEY (memberID)  
);


insert into membership
values(0001),(0002),(0003),(0004),(0005),(0006),(0007),(0008),(0009),(0010)
-----------------------------------------------------------------------------------------------
-- Table: journey

CREATE TABLE journey (
    jID int  NOT NULL identity,
    jName varchar(14)  NOT NULL,
    memberID int  NOT NULL,
    jAlterDate datetime  NOT NULL,
    jStartDate datetime  NOT NULL,
    jEnddate datetime  NOT NULL,
    CONSTRAINT journey_pk PRIMARY KEY  (jID),
	FOREIGN KEY (memberID) REFERENCES membership (memberID)
);

insert into journey(jName,memberID,jAlterDate,jStartDate,jEnddate)
values
('火星5分鐘遊',0001,getdate(),2099-12-31,2099-12-31),
('地下室10年遊',0002,getdate(),2020-12-31,2030-12-31),
('廁所30秒遊',0003,getdate(),2099-12-31,2099-12-31),
('操場3000公尺遊',0004,getdate(),2099-12-31,2099-12-31),
('我到此一遊',0005,getdate(),2099-12-31,2099-12-31)
;

---------------------------------------------------------------------------------------------
-- Table: 機票訂單 flightOrder

CREATE TABLE flightOrder (
    TicketID int  NOT NULL,
    orderID int  NOT NULL,
    memberID int  NOT NULL,
    CONSTRAINT flightOrder_pk PRIMARY KEY  (TicketID),
	FOREIGN KEY (memberID) REFERENCES membership (memberID)
);

insert into flightOrder
values(0001,0001,0001),(0002,0002,0002),(0003,0003,0003),(0004,0004,0004),(0005,0005,0005)

-------------------------------------------------------------------------------------------------

-- Table: 景點票訂單 AttractionOrder

CREATE TABLE AttractionOrder (
    planID int  NOT NULL,
    memberID int  NOT NULL,
	 CONSTRAINT AttractionOrder_pk PRIMARY KEY  (memberID,planID),
	 FOREIGN KEY (memberID) REFERENCES membership (memberID)
);

insert into AttractionOrder
values(0001,0001),(0002,0002),(0003,0003),(0004,0004),(0005,0005),(0006,0006)

-----------------------------------------------------------------------------------------


-- tables
-- Table: JourneyAttraction
CREATE TABLE JourneyAttraction (
    planID int  NOT NULL,
    memberID int  NOT NULL,
    jID int  NOT NULL,
	CONSTRAINT JourneyAttraction_pk PRIMARY KEY  (planID,memberID,jID),
	FOREIGN KEY (memberID,planID) REFERENCES AttractionOrder (memberID,planID),
	FOREIGN KEY (jID) REFERENCES journey (jID)
);

insert into JourneyAttraction
values(0001,0001,0001),(0002,0002,0002),(0003,0003,0003),(0004,0004,0004)

------------------------------------------------------------------------------------------------
-- Table: 飯店房間訂單 roomOrder
drop table flightOrder
CREATE TABLE roomOrder (
    roomID int  NOT NULL,
    memberID int  NOT NULL,
    CONSTRAINT roomOrder_pk PRIMARY KEY  (roomID,memberID),
	FOREIGN KEY (memberID) REFERENCES membership (memberID)
);

insert into roomOrder
values(1,1),(2,2),(3,3),(4,4),(5,5)
-----------------------------------------------------------------------------------------------------

-- Table: JourneyRoom
CREATE TABLE JourneyRoom (
    roomID int  NOT NULL,
    memberID int  NOT NULL,
    jID int  NOT NULL,
    CONSTRAINT JourneyRoom_pk PRIMARY KEY  (roomID,memberID,jID),
	FOREIGN KEY (roomID,memberID) REFERENCES roomOrder (roomID,memberID),
);
insert into JourneyRoom
values(1,1,1),(2,2,2),(3,3,3),(4,4,4)
-------------------------------------------------------------------------------------------------------



-- Table: journeyFlight
CREATE TABLE journeyFlight (
    ticketID int  NOT NULL,
    memberID int  NOT NULL,
    jID int  NOT NULL,
    CONSTRAINT journeyFlight_pk PRIMARY KEY  (ticketID,memberID,jID),
	FOREIGN KEY (ticketID) REFERENCES flightorder (ticketID),
	FOREIGN KEY (jID) REFERENCES journey (jID)
);

insert into journeyFlight
values(1,1,1),(2,2,2),(3,3,3),(4,4,4)





ALTER TABLE membership
ADD FOREIGN KEY  REFERENCES CUSTOMER (SID);


insert into JourneyAttraction


select * from journey;
select * from AttractionOrder;
select * from membership;
select * from flightOrder;
select * from journeyFlight;
