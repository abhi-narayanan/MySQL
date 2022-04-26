create database Assgn;
use Assgn;

create table EMP
(EID char(5), 
Name varchar(10) NOT NULL, 
Addr varchar(15), 
City varchar(10),
DOB date, 
Phone char(10), 
Email varchar(20),
primary key (EID),
check (ADDR NOT LIKE '%Uttam Nagar'),
check (CITY in ('Delhi','Gurgaon','Faridabad','Noida')),
unique (Phone),
check (Email LIKE '%@gmail%' or Email LIKE '%@yahoo%'),
check (DOB >= '1990-01-01'));

drop table EMP;
select * from EMP;
insert into EMP
values ('E0001', 'Abhishek', 'Dahisar', 'Delhi', '1996-12-02', '8082141785', 'shekky@yahoo.com');

create table EMP_SAL
(EID char(5), DEPT varchar(10) default 'TEMP', DESI varchar(15), Salary int, DOJ Date,
foreign key (EID) references EMP(EID),
check (DEPT in ('HR','MIS','OPS','IT','ADMIN','TEMP')),
check (DESI in ('ASSO','MGR','VP','DIR')),
check (Salary >= 20000));