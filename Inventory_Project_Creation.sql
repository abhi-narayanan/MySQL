create database INVENTORY;

use INVENTORY;

create table SUPPLIER
(SID char(5) unique,
SNAME VARCHAR(20) NOT NULL,
SADD VARCHAR(20) NOT NULL,
SCITY CHAR(10) DEFAULT 'DELHI',
SPHONE CHAR(10),
EMAIL VARCHAR(25),
UNIQUE (SPHONE));

create table CUST
(CID char(5) unique,
CNAME varchar(20) NOT NULL,
ADDRESS varchar(20) NOT NULL,
CITY varchar(10) NOT NULL,
PHONE char(10) NOT NULL,
EMAIL varchar(20) NOT NULL,
DOB date,
check (DOB < '2000-01-01'));

create table PRODUCT
(PID char(5), 
PDESC char(20) NOT NULL,
PRICE int,
CATEGORY char(2),
SID char(5),
primary key (PID),
check (PRICE >= 0),
check (CATEGORY in ('IT', 'HA', 'HC')),
foreign key (SID) references SUPPLIER(SID));

create table ORDERS
(OID char(5) unique,
ODATE date,
CID char(5),
PID char(5),
OQTY int,
check (OQTY >= 1),
foreign key (PID) references PRODUCT(PID),
foreign key (CID) references CUST(CID));

create table STOCK
(PID char(5),
SQTY int,
ROL int,
MOQ int,
check (SQTY >= 0),
check (ROL > 0),
check (MOQ >= 5),
foreign key (PID) references PRODUCT(PID));


drop table PRODUCT;
drop table ORDERS;
drop table SUPPLIER;
drop table STOCK;
drop table CUST;
