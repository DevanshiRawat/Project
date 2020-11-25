create database OFMS_Database
go

use OFMS_Database
go

--loginDetails table creation
create table LoginDetails(
	UserId int foreign key references UserDetails(UserId),
	Password varchar NOT NULL,
	UserType varchar NOT NULL
)
go

-- creating table userDetails
create table UserDetails( 
	UserId int IDENTITY(10000,1) PRIMARY KEY,
    Name varchar(30) NOT NULL,
	[Email Id] varchar(50) NOT NULL,
	Age int NOT NULL,
	Gender char check (Gender in ('F', 'M')),
	ContactNo BigInt NOT NULL,
	Address varchar(50) NOT NULL,
	PrepaidWallet money NOT NULL
)
go
	
--Flights table will have flight details
create table Flights(
	[Flight No] int NOT NULL PRIMARY KEY,
	Source varchar(20) NOT NULL,
	Destination varchar(20) NOT NULL,
	Arrival datetime NOT NULL,
	Departure datetime NOT NULL,
	Duration time NOT NULL,
	[No of Seats] int NOT NULL,
	[Economy Class Price] int NOT NULL,
	[Business Class Price] int NOT NULL 
)
go

--Seats table will have info about the seats in each flight
create table Seats(
	[Seat No] int NOT NULL PRIMARY KEY,
	[Flight No] int FOREIGN KEY REFERENCES Flights([Flight No]),
	Class char CHECK (Class in ('B','E')),
	Price int
)
go

--Ticket table will have detail about the passenger flight bookings
create table Tickets(
	[Ticket No] int NOT NULL PRIMARY KEY,
	[Booking No] int FOREIGN KEY REFERENCES Bookings([Booking No]) ,
	[Flight No] int FOREIGN KEY REFERENCES Flights([Flight No]),
	[Cancelation Date] datetime,
	Price int,
)
go

create table Bookings(
	UserId int NOT NULL,
	[Booking No] int IDENTITY(111000,1) PRIMARY KEY,
	DateOfBooking datetime NOT NULL,
	TransactionNo int NOT NULL,
	NoOfPassengers int NOT NULL,
	TotalFare int NOT null,
	CONSTRAINT FK_BookingUserId FOREIGN KEY (UserId) REFERENCES UserDetails(UserId)
)
go
