create database learn8;
use learn8;

create table STU
(RNo int, Name Char(5), Age int);

insert into STU (RNo, Name, Age)
values (1, 'Abhi', 25);

insert into STU
values (2, 'Kapil', 29);

insert into STU (RNo, Name)
values (3, 'Jay');

insert into STU (Name, RNo, Age)
values ('Yash', 4, 14);

select RNo, Name, Age from STU;

select * from STU;

select Name from STU;

update STU set Age = 27
where Name = 'Kapil';

delete from STU
where RNo = 3;

alter table STU
add Class char(5);

update STU set Class = '7TH';

alter table STU
drop column Class;

insert into STU
values (5, 'Ravindra', 65);

alter table STU
modify column Name varchar(10);

drop table STU;

drop database learn8;

truncate table STU;

select * from STU
where Name = 'Abhi' OR Age >= 25;

select * from STU
where NOT Name = 'Kapil';

select * from STU
where Age >= 20 AND Age <= 30;

select * from STU;

-- BETWEEN - RANGE
select * from STU
where Age BETWEEN 20 AND 30;

-- IN - LIST
select * from STU
where Name = 'Abhi' OR Name = 'Yash' OR Name = 'Ravindra';

select * from STU
where Name IN ('Abhi', 'Yash');

-- IS NULL - Checks for Null Value
select * from STU
where Age IS NULL;

-- DISTINCT - Unique values of a field
select distinct Name from STU;

use learn8;

select * from STU;

insert into STU(RNo, Name)
values (3, 'Rajat');

alter table STU
modify Age int NOT NULL;

insert into STU
values (6, 'Rohit', 48);

alter table STU
alter Age set default '42';

alter table STU
add unique (RNo);

alter table STU
drop constraint RNo;

alter table STU
add check (Age>=14);

delete from STU
where RNo = 3;

alter table STU
add constraint PK_RNo primary key (RNo);

ALTER TABLE STU
DROP PRIMARY KEY;

