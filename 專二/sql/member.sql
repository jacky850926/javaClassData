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
    statusName int  NOT NULL,
    CONSTRAINT memberStatus_pk PRIMARY KEY  (statusID)
);

-- Table: membership
CREATE TABLE membership (
    memberID int  NOT NULL,
    statusID int  NOT NULL,
    account varchar(14)  NOT NULL,
    password varchar(14)  NOT NULL,
    name varchar(99)  NOT NULL,
    nickName varchar(10)  NULL,
    phone varchar(10)  NULL,
    nationality varchar(14)  NOT NULL,
    birth datetime  NOT NULL,
    gender nvarchar  NOT NULL,
    address varchar(20)  NOT NULL,
    email varchar(20)  NOT NULL,
    createTime datetime  NOT NULL,
    modifyTime datetime  NOT NULL,
    CONSTRAINT membership_pk PRIMARY KEY  (memberID)
);