-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2022-07-29 07:26:18.643

-- tables
-- Table: Hotel
CREATE TABLE Hotel (
    hotelID int  NOT NULL,
    hotelName nvarchar(20)  NOT NULL,
    hotelLocate nvarchar(20)  NOT NULL,
    hotelIntro nvarchar(max)  NULL,
    hotelphoto varbinary(max)  NULL,
    hotelphoto2 varbinary(max)  NOT NULL,
    hotelphoto3 varbinary(max)  NOT NULL,
    hotelphoto4 varbinary(max)  NOT NULL,
    hotelphoto5 varbinary(max)  NOT NULL,
    hotelphoto6 varbinary(max)  NOT NULL,
    hotelphoto7 varbinary(max)  NOT NULL,
    CONSTRAINT Hotel_pk PRIMARY KEY  (hotelID)
);

-- Table: JourneyAttraction
CREATE TABLE JourneyAttraction (
    planID int  NOT NULL,
    memberID int  NOT NULL,
    jID int  NOT NULL,
    date datetime  NOT NULL,
    CONSTRAINT JourneyAttraction_pk PRIMARY KEY  (planID,memberID,jID)
);

-- Table: JourneyRoom
CREATE TABLE JourneyRoom (
    roomID int  NOT NULL,
    memberID int  NOT NULL,
    jID int  NOT NULL,
    date datetime  NOT NULL,
    CONSTRAINT JourneyRoom_pk PRIMARY KEY  (roomID,memberID,jID)
);

-- Table: airplaneGrade
CREATE TABLE airplaneGrade (
    gradeID int  NOT NULL,
    gradeName nvarchar  NOT NULL,
    CONSTRAINT airplaneGrade_pk PRIMARY KEY  (gradeID)
);

-- Table: airport
CREATE TABLE airport (
    airportID int  NOT NULL,
    airportName nvarchar(10)  NOT NULL,
    CONSTRAINT airport_pk PRIMARY KEY  (airportID)
);

-- Table: article
CREATE TABLE article (
    PostID int  NOT NULL,
    PosterID int  NOT NULL,
    bigClassID int  NOT NULL,
    articleClassID int  NOT NULL,
    content nvarchar(max)  NOT NULL,
    Title nvarchar(12)  NOT NULL,
    articleDate datetime  NOT NULL,
    photo varbinary  NULL,
    CONSTRAINT article_pk PRIMARY KEY  (PostID)
);

-- Table: articleClass
CREATE TABLE articleClass (
    classID int  NOT NULL,
    className nvarchar  NOT NULL,
    CONSTRAINT articleClass_pk PRIMARY KEY  (classID)
);

-- Table: attraction
CREATE TABLE attraction (
    attractionID int  NOT NULL,
    prefer_id int  NOT NULL,
    name nvarchar(14)  NOT NULL,
    location nvarchar(20)  NOT NULL,
    description nvarchar(max)  NOT NULL,
    photo varbinary(max)  NULL,
    photo2 varbinary(max)  NOT NULL,
    photo3 varbinary(max)  NOT NULL,
    photo4 varbinary(max)  NOT NULL,
    Notice varchar(max)  NOT NULL,
    CONSTRAINT attraction_pk PRIMARY KEY  (attractionID)
);

-- Table: attractionClass
CREATE TABLE attractionClass (
    classID int  NOT NULL,
    className nvarchar(10)  NOT NULL,
    CONSTRAINT attractionClass_pk PRIMARY KEY  (classID)
);

-- Table: attractionPair
CREATE TABLE attractionPair (
    attractionID int  NOT NULL,
    classID int  NOT NULL,
    CONSTRAINT attractionPair_pk PRIMARY KEY  (attractionID,classID)
);

-- Table: bigClass
CREATE TABLE bigClass (
    bigClassID int  NOT NULL,
    moderator nvarchar  NOT NULL,
    moderatorName nvarchar  NOT NULL,
    moderatorIntro nvarchar  NULL,
    CONSTRAINT bigClass_pk PRIMARY KEY  (bigClassID)
);

-- Table: flightTicket
CREATE TABLE flightTicket (
    flightID varchar(14)  NOT NULL,
    classID int  NOT NULL,
    departureTime datetime  NOT NULL,
    arrivalTime datetime  NOT NULL,
    fare int  NOT NULL,
    airline nvarchar(10)  NOT NULL,
    originID int  NOT NULL,
    destinationID int  NOT NULL,
    CONSTRAINT flightTicket_pk PRIMARY KEY  (flightID,classID)
);

-- Table: hashtag
CREATE TABLE hashtag (
    articleID int  NOT NULL,
    hashtag nvarchar  NOT NULL,
    CONSTRAINT hashtag_pk PRIMARY KEY  (articleID)
);

-- Table: journey
CREATE TABLE journey (
    jID int  NOT NULL identity,
    jName varchar(14)  NOT NULL,
    memberID int  NOT NULL,
    jAlterDate datetime  NOT NULL,
    jStartDate datetime  NOT NULL,
    jEnddate datetime  NOT NULL,
    CONSTRAINT journey_pk PRIMARY KEY  (jID)
);

-- Table: journeyFlight
CREATE TABLE journeyFlight (
    ticketID int  NOT NULL,
    jID int  NOT NULL,
    memberID int  NOT NULL,
    date datetime  NOT NULL,
    CONSTRAINT journeyFlight_pk PRIMARY KEY  (ticketID,jID)
);

-- Table: luggage
CREATE TABLE luggage (
    jID int  NOT NULL,
    luggageID int  NOT NULL,
    luggageName varchar  NOT NULL,
    CONSTRAINT luggage_pk PRIMARY KEY  (jID,luggageID)
);

-- Table: memberPrefer
CREATE TABLE memberPrefer (
    memberID int  NOT NULL,
    prefer_id int  NOT NULL,
    CONSTRAINT memberPrefer_pk PRIMARY KEY  (memberID,prefer_id)
);

-- Table: memberStatus
CREATE TABLE memberStatus (
    statusID int  NOT NULL,
    statusName nvarchar(10)  NOT NULL,
    CONSTRAINT memberStatus_pk PRIMARY KEY  (statusID)
);

-- Table: membership
CREATE TABLE membership (
    memberID int  NOT NULL,
    statusID int  NOT NULL,
    CONSTRAINT membership_pk PRIMARY KEY  (memberID)
);

-- Table: orderAttraction
CREATE TABLE orderAttraction (
    planID int  NOT NULL,
    memberID int  NOT NULL,
    attractionID int  NOT NULL,
    orderDate datetime  NOT NULL,
    planFee int  NOT NULL,
    name nvarchar(14)  NOT NULL,
    planName nvarchar(20)  NOT NULL,
    planDiscript nvarchar(max)  NOT NULL,
    CONSTRAINT orderAttraction_pk PRIMARY KEY  (planID,memberID)
);

-- Table: orderClass
CREATE TABLE orderClass (
    orderID int  NOT NULL,
    className nvarchar(10)  NOT NULL,
    CONSTRAINT orderClass_pk PRIMARY KEY  (orderID)
);

-- Table: orderFlight
CREATE TABLE orderFlight (
    TicketID int  NOT NULL,
    orderID int  NOT NULL,
    memberID int  NOT NULL,
    classID int  NOT NULL,
    flightID varchar(14)  NOT NULL,
    buyDate datetime  NOT NULL,
    orderDate datetime  NOT NULL,
    fare int  NOT NULL,
    airline nvarchar(10)  NOT NULL,
    originID int  NOT NULL,
    destinationID int  NOT NULL,
    airportID int  NOT NULL,
    airportName nvarchar(10)  NOT NULL,
    gradeName nvarchar(10)  NOT NULL,
    CONSTRAINT orderFlight_pk PRIMARY KEY  (TicketID)
);

-- Table: orderRoom
CREATE TABLE orderRoom (
    roomID int  NOT NULL,
    memberID int  NOT NULL,
    CONSTRAINT orderRoom_pk PRIMARY KEY  (roomID,memberID)
);

-- Table: plan
CREATE TABLE "plan" (
    planID int  NOT NULL,
    attractionID int  NOT NULL,
    planName nvarchar(20)  NOT NULL,
    planFee int  NOT NULL,
    planDiscript nvarchar(max)  NULL,
    CONSTRAINT plan_pk PRIMARY KEY  (planID)
);

-- Table: prefer
CREATE TABLE prefer (
    prefer_id int  NOT NULL,
    preferName nvarchar(10)  NOT NULL,
    preferDescrip nvarchar(20)  NOT NULL,
    CONSTRAINT prefer_pk PRIMARY KEY  (prefer_id)
);

-- Table: reply
CREATE TABLE reply (
    replyID int  NOT NULL,
    articleID int  NOT NULL,
    replyMember int  NOT NULL,
    replyContent nvarchar  NOT NULL,
    replyTime datetime  NOT NULL,
    CONSTRAINT reply_pk PRIMARY KEY  (replyID)
);

-- Table: roomData
CREATE TABLE roomData (
    roomID int  NOT NULL,
    roomNO int  NOT NULL,
    hotelID int  NOT NULL,
    roomName nvarchar(30)  NOT NULL,
    roomPrice int  NOT NULL,
    capacity int  NOT NULL,
    somke varchar  NOT NULL,
    pet varchar  NOT NULL,
    bedAdd varchar  NOT NULL,
    breakfast varchar  NOT NULL,
    styleID int  NOT NULL,
    photo1 varbinary(max)  NOT NULL,
    photo2 varbinary(max)  NOT NULL,
    photo3 varbinary(max)  NOT NULL,
    photo4 varbinary(max)  NOT NULL,
    CONSTRAINT roomData_pk PRIMARY KEY  (roomID)
);

-- Table: roomStyle
CREATE TABLE roomStyle (
    styleID int  NOT NULL,
    styleName nvarchar(10)  NOT NULL,
    CONSTRAINT roomStyle_pk PRIMARY KEY  (styleID)
);

-- foreign keys
-- Reference: a (table: journey)
ALTER TABLE journey ADD CONSTRAINT a
    FOREIGN KEY (memberID)
    REFERENCES membership (memberID);

-- Reference: articleClass_article (table: article)
ALTER TABLE article ADD CONSTRAINT articleClass_article
    FOREIGN KEY (articleClassID)
    REFERENCES articleClass (classID);

-- Reference: article_hashtag (table: hashtag)
ALTER TABLE hashtag ADD CONSTRAINT article_hashtag
    FOREIGN KEY (articleID)
    REFERENCES article (PostID);

-- Reference: article_membership (table: article)
ALTER TABLE article ADD CONSTRAINT article_membership
    FOREIGN KEY (PosterID)
    REFERENCES membership (memberID);

-- Reference: attractionClass_attractionPair (table: attractionPair)
ALTER TABLE attractionPair ADD CONSTRAINT attractionClass_attractionPair
    FOREIGN KEY (classID)
    REFERENCES attractionClass (classID);

-- Reference: attractionPair_attraction (table: attractionPair)
ALTER TABLE attractionPair ADD CONSTRAINT attractionPair_attraction
    FOREIGN KEY (attractionID)
    REFERENCES attraction (attractionID);

-- Reference: attraction_prefer (table: attraction)
ALTER TABLE attraction ADD CONSTRAINT attraction_prefer
    FOREIGN KEY (prefer_id)
    REFERENCES prefer (prefer_id);

-- Reference: b (table: JourneyRoom)
ALTER TABLE JourneyRoom ADD CONSTRAINT b
    FOREIGN KEY (jID)
    REFERENCES journey (jID);

-- Reference: c (table: flightTicket)
ALTER TABLE flightTicket ADD CONSTRAINT c
    FOREIGN KEY (classID)
    REFERENCES airplaneGrade (gradeID);

-- Reference: d (table: flightTicket)
ALTER TABLE flightTicket ADD CONSTRAINT d
    FOREIGN KEY (originID)
    REFERENCES airport (airportID);

-- Reference: e (table: flightTicket)
ALTER TABLE flightTicket ADD CONSTRAINT e
    FOREIGN KEY (destinationID)
    REFERENCES airport (airportID);

-- Reference: flightOrder_flightTicket (table: orderFlight)
ALTER TABLE orderFlight ADD CONSTRAINT flightOrder_flightTicket
    FOREIGN KEY (flightID,classID)
    REFERENCES flightTicket (flightID,classID);

-- Reference: flightOrder_orderClass (table: orderFlight)
ALTER TABLE orderFlight ADD CONSTRAINT flightOrder_orderClass
    FOREIGN KEY (orderID)
    REFERENCES orderClass (orderID);

-- Reference: g (table: roomData)
ALTER TABLE roomData ADD CONSTRAINT g
    FOREIGN KEY (hotelID)
    REFERENCES Hotel (hotelID);

-- Reference: h (table: JourneyAttraction)
ALTER TABLE JourneyAttraction ADD CONSTRAINT h
    FOREIGN KEY (jID)
    REFERENCES journey (jID);

-- Reference: n (table: journeyFlight)
ALTER TABLE journeyFlight ADD CONSTRAINT n
    FOREIGN KEY (jID)
    REFERENCES journey (jID);

-- Reference: plan_attraction (table: plan)
ALTER TABLE "plan" ADD CONSTRAINT plan_attraction
    FOREIGN KEY (attractionID)
    REFERENCES attraction (attractionID);

-- Reference: prefer_memberPrefer (table: memberPrefer)
ALTER TABLE memberPrefer ADD CONSTRAINT prefer_memberPrefer
    FOREIGN KEY (prefer_id)
    REFERENCES prefer (prefer_id);

-- Reference: product_purchase_item (table: article)
ALTER TABLE article ADD CONSTRAINT product_purchase_item
    FOREIGN KEY (bigClassID)
    REFERENCES bigClass (bigClassID);

-- Reference: q (table: orderRoom)
ALTER TABLE orderRoom ADD CONSTRAINT q
    FOREIGN KEY (memberID)
    REFERENCES membership (memberID);

-- Reference: r (table: memberPrefer)
ALTER TABLE memberPrefer ADD CONSTRAINT r
    FOREIGN KEY (memberID)
    REFERENCES membership (memberID);

-- Reference: reply_article (table: reply)
ALTER TABLE reply ADD CONSTRAINT reply_article
    FOREIGN KEY (articleID)
    REFERENCES article (PostID);

-- Reference: reply_member (table: reply)
ALTER TABLE reply ADD CONSTRAINT reply_member
    FOREIGN KEY (replyMember)
    REFERENCES membership (memberID);

-- Reference: s (table: orderAttraction)
ALTER TABLE orderAttraction ADD CONSTRAINT s
    FOREIGN KEY (planID)
    REFERENCES "plan" (planID);

-- Reference: t (table: roomData)
ALTER TABLE roomData ADD CONSTRAINT t
    FOREIGN KEY (styleID)
    REFERENCES roomStyle (styleID);

-- Reference: u (table: journeyFlight)
ALTER TABLE journeyFlight ADD CONSTRAINT u
    FOREIGN KEY (ticketID)
    REFERENCES orderFlight (TicketID);

-- Reference: v (table: orderRoom)
ALTER TABLE orderRoom ADD CONSTRAINT v
    FOREIGN KEY (roomID)
    REFERENCES roomData (roomID);

-- Reference: w (table: orderAttraction)
ALTER TABLE orderAttraction ADD CONSTRAINT w
    FOREIGN KEY (memberID)
    REFERENCES membership (memberID);

-- Reference: x (table: JourneyAttraction)
ALTER TABLE JourneyAttraction ADD CONSTRAINT x
    FOREIGN KEY (planID,memberID)
    REFERENCES orderAttraction (planID,memberID);

-- Reference: y (table: luggage)
ALTER TABLE luggage ADD CONSTRAINT y
    FOREIGN KEY (jID)
    REFERENCES journey (jID);

-- Reference: yee (table: JourneyRoom)
ALTER TABLE JourneyRoom ADD CONSTRAINT yee
    FOREIGN KEY (roomID,memberID)
    REFERENCES orderRoom (roomID,memberID);

-- Reference: z (table: orderFlight)
ALTER TABLE orderFlight ADD CONSTRAINT z
    FOREIGN KEY (memberID)
    REFERENCES membership (memberID);

-- Reference: 會員_會員等級 memberStatus (table: membership)
ALTER TABLE membership ADD CONSTRAINT paa
    FOREIGN KEY (statusID)
    REFERENCES memberStatus (statusID);

-- End of file.

