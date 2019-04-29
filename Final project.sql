create database dreamhomerental;
use dreamhomerental;
create table if not exists Branch(
branchNo varchar(4) not null,
street varchar(20) not null,
city varchar(10) not null,
postcode varchar(8) not null,
primary key (branchNo));
create table if not exists Staff(
staffNo varChar(4) not null,
fName varchar(10) not null,
lName varchar(10) not null,
title varchar(10) not null,
sex enum('M','F'),
DOB date not null,
salary int not null,
branchNo varchar(4) not null,
primary key (staffNo),
foreign key (branchNo) references branch(branchNo));
create table if not exists Clients
(
clientNo varchar(4) not null,
fName varchar(10) not null,
lName varchar(10) not null,
telNo varchar(13) not null,
preftype enum('House','Flat') not null,
maxRent int not null,
email varchar(30) not null,
primary key (clientNo));
create table if not exists Registration(
clientNo varchar(4) not null,
branchNo varchar(4) not null,
staffNo varchar(4) not null,
dataJoined date not null,
foreign key (clientNo) references clients(clientNo),
foreign key (branchNo) references branch(branchNo),
foreign key (staffNo) references staff(staffNo));
create table if not exists privateOwner(
ownerNo varchar(4) not null,
fName varchar(10) not null,
lName varchar(10) not null,
address varchar(40) not null,
telNo varchar(13) not null,
email varchar(30) not null,
password varchar(10) not null,
primary key (ownerNo)
);

create table if not exists PropertyForRent(
propertyNo varchar(4) not null,
street varchar(20) not null,
city varchar(10) not null,
postcode varchar(7) not null,
typeofprop enum('House','Flat') not null,
rooms int not null,
rent int not null,
ownerNo varchar(4) not null,
staffNo varchar(4),
branchNo varchar(4) not null,
primary key (propertyNo),
foreign key(ownerNo) references privateowner(ownerNo),
foreign key(staffNo) references staff(staffNo),
foreign key(branchNo) references branch(branchNo)
);
create table if not exists Viewing(
clientNo varchar(4) not null,
propertyNo varchar(4) not null,
viewDate date not null,
comments varchar(20),
foreign key (clientNo) references clients(clientNo),
foreign key (propertyNo) references propertyforrent(propertyNo)
);
alter table propertyforrent
add check (rent<800);
INSERT INTO Branch VALUES
    ('B005','22 Deer Rd','London','SW1 4EH'),
    ('B007','16 Argyll St','Aberdeen','AB2 3SU'),
    ('B003','163 Main St','Glasgow','G11 9QX'),
    ('B004','32 Manse Rd','Bristol','BS99 1NZ'),
    ('B002','56 Clover Dr','London','NW10 6EU');
show tables;
describe branch;
describe clients;
describe privateowner;
describe propertyforrent;
describe registration;
describe staff;
describe viewing;
alter table registration 
change column dataJoined dateJoined date;


INSERT INTO PrivateOwner VALUES
    ('CO46','Joe','Keogh','2 Fergus Dr, Aberdeen AB2 7SX','01224-861212','jkeough@lhh.com','*******'),
    ('CO87','Carol','Farrel','6 Achray St, Glasgow G32 9DX','0141-357-7419','cfarrel@gmail.com','*******'),
    ('CO40','Tina','Murphy','63 Well St, Glasgow G42','0141-943-1728','tinam@hotmail.com','*******'),
    ('CO93','Tony','Shaw','12 Park Pl, Glasgow G4 0QR','0141-225-7025','tony.shaw@ark.com','*******');
INSERT INTO Staff VALUES
    ('SL21','John','White','Manager','M','1945-10-01 00:00:00',30000,'B005'),
    ('SG37','Ann','Beech','Assistant','F','1960-11-10 00:00:00',12000,'B003'),
    ('SG14','David','Ford','Supervisor','M','1958-03-24 00:00:00',18000,'B003'),
    ('SA9','Mary','Howe','Assistant','F','1970-02-19 00:00:00',9000,'B007'),
    ('SG5','Susan','Brand','Manager','F','1940-06-03 00:00:00',24000,'B003'),
    ('SL41','Julie','Lee','Assistant','F','1965-06-13 00:00:00',9000,'B005');
INSERT INTO Clients VALUES
    ('CR76','John','Kay','0207-774-5632','Flat',425,'john.kay@gmail.com'),
    ('CR56','Aline','Stewart','0141-848-1825','Flat',350,'astewart@hotmail.com'),
    ('CR74','Mike','Ritchie','01475-392178','House',750,'mritchie01@yahoo.co.uk'),
    ('CR62','Mary','Tregear','01224-196720','Flat',600,'maryt@hotmail.co.uk');
INSERT INTO PropertyForRent VALUES
    ('PA14','16 Holhead','Aberdeen','AB7 5SU','House',6,650,'CO46','SA9','B007'),
    ('PL94','6 Argyll St','London','NW2','Flat',4,400,'CO87','SL41','B005'),
    ('PG4','6 Lawrence St','Glasgow','G11 9QX','Flat',3,350,'CO40',NULL,'B003'),
    ('PG36','2 Manor Rd','Glasgow','G32 4QX','Flat',3,375,'CO93','SG37','B003'),
    ('PG21','18 Dale Rd','Glasgow','G12','House',5,600,'CO87','SG37','B003'),
    ('PG16','5 Novar Dr','Glasgow','G12 9AX','Flat',4,450,'CO93','SG14','B003');
INSERT INTO Viewing VALUES
    ('CR56','PA14','2013-05-24 00:00:00','too small'),
    ('CR76','PG4','2013-04-20 00:00:00','too remote'),
    ('CR56','PG4','2013-05-26 00:00:00',NULL),
    ('CR62','PA14','2013-05-14 00:00:00','no dining room'),
    ('CR56','PG36','2013-04-28 00:00:00',NULL);
INSERT INTO Registration VALUES
    ('CR76','B005','SL41','2013-01-02 00:00:00'),
    ('CR56','B003','SG37','2012-04-11 00:00:00'),
    ('CR74','B003','SG37','2011-11-16 00:00:00'),
    ('CR62','B007','SA9','2012-03-07 00:00:00');
