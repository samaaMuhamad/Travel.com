CREATE DATABASE hotel;
use hotel;
DROP TABLE IF EXISTS User;

CREATE TABLE User(
username varchar(20) unique not null,
name varchar(20) not null,
password varchar(20) not null,
email varchar(40) not null,
mobile varchar(20) not null,
type varchar(20) not null,
hotelName varchar(20) ,
primary key (username)

);

CREATE TABLE Hotel
(
  name VARCHAR(20) NOT NULL,
  rating float ,
 meals VARCHAR(20) ,
  expectedPrice float NOT NULL,
  numberOfAvailableRooms int NOT NULL,
  startAvDate date NOT NULL,
   endAvDate date NOT NULL,
   location VARCHAR(20) NOT NULL,
   contactInformation VARCHAR(70) NOT NULL,
   hotelFacilities VARCHAR(70),
   distance float not null,
   stars int not null,
   otherBranches VARCHAR(70) ,
   langitude float,
   latitude float,
  PRIMARY KEY (name)
);

create table images(

path varchar(200) primary key ,
hotel varchar(45) not null
);
CREATE TABLE Room
(
  type VARCHAR(20) NOT NULL,
  roomNumber VARCHAR(20) NOT NULL,
  roomFacilities VARCHAR(70),
  startAvDate date NOT NULL,
   endAvDate date NOT NULL,
   hotel VARCHAR(20) NOT NULL,
   reserved VARCHAR(45) default 'false', 
   primary key(roomNumber)
);

CREATE TABLE Reservation
(
  reservationID VARCHAR(20) NOT NULL,
  fromDate date NOT NULL,
   toDate date NOT NULL,
   hotel VARCHAR(20) NOT NULL,
   client  VARCHAR(20) NOT NULL,
   payment  VARCHAR(20) NOT NULL,
   roomNumber varchar(20),
   adults int not null,
   children int not null,
   primary key(reservationID)
);
Create table checkin
(
checkinDate Date not null,
checkoutDate Date ,
reservationID varchar(20) not null
);

Create table comments
(
stars int not null,
comment varchar(250) not null,
hotel varchar(20) not null,
username varchar(20) not null
);


