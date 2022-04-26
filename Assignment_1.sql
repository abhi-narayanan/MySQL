create database DEMO;
use DEMO;
create table EMP
(EID char(5), Name varchar(10), Addr varchar(15), City varchar(10),
DOB date, Phone char(10), Email varchar(20));

insert into EMP (EID, Name, Addr, City, DOB, Phone, Email)
values ('E0001', 'Abhishek', 'Dahisar', 'Mumbai', '1996-12-02', '8082141785', 'shekky@gmail.com');

insert into EMP values ('E0002', 'Anushka', 'Dahisar', 'Mumbai', '2001-02-22', '8879189680', 'malkara@gmail.com'),
('E0003', 'Aaron', 'Dahisar', 'Mumbai', '1991-07-21', '9136294362', 'aaronds@gmail.com'),
('E0004', 'Rhishikesh', 'Dadar', 'Mumbai', '1997-07-02', '9420888567', 'rhishikesh@gmail.com'),
('E0005', 'Ajay', 'Boisar', 'Mumbai', '1996-08-23', '7020173314', 'ajaypatel@gmail.com'),
('E0006', 'Vasanti', 'Dahisar', 'Mumbai', '1967-04-21', '9757260087', 'vasanti@gmail.com'),
('E0007', 'Narayanan', 'Dahisar', 'Mumbai', '1965-03-21', '8390438436', 'narayanan@gmail.com'),
('E0008', 'Yash', 'Dahisar', 'Mumbai', '1996-03-11', '6476090410', 'yash@gmail.com'),
('E0009', 'Dhruv', 'Malad', 'Mumbai', '2001-09-08', '9137494064', 'dhruv@gmail.com'),
('E0010', 'Saudamini', 'Dahisar', 'Mumbai', '1977-01-12', '9833121706', 'smalkar@gmail.com');

select * from EMP;

select * from EMP
where Addr = 'Dadar';

-- LIKE - Pattern Matching % - Any No of characters _ a single character

select * from EMP
where Name LIKE 'A%';

select * from EMP
where Addr LIKE '%ar';

select * from EMP
where Name LIKE '%as%';

select * from EMP
where Name LIKE '____';

select count(Name) from EMP;

select distinct ADDR from EMP;

select * from EMP
order by Name;

select * from EMP
order by Email Desc;

select Addr, count(EID) as EMP_COUNT
from EMP
group by Addr
order by Addr desc;

select * from EMP
where Email NOT LIKE '%@gmail%';
