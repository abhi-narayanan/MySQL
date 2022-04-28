use demo;

select * from EMP;
select * from EMP_SAL;

select EMP.EID, EMP.NAME, EMP.CITY, EMP_SAL.DEPT, EMP_SAL.DESI, EMP_SAL.Salary
from EMP
INNER JOIN EMP_SAL
on EMP.EID = EMP_SAL.EID;

-- Table Alias
select E1.EID, E1.NAME, E1.CITY, E2.DEPT, E2.DESI, E2.Salary
from EMP E1
INNER JOIN EMP_SAL E2
on E1.EID = E2.EID;

select EMP.EID, EMP.Name, CITY, DEPT, DESI, Salary
from EMP
INNER JOIN EMP_SAL
on EMP.EID = EMP_SAL.EID;

select EMP.EID, EMP.Name, CITY, DEPT, DESI, Salary
from EMP
LEFT JOIN EMP_SAL
on EMP.EID = EMP_SAL.EID;

select EMP.EID, EMP.Name, CITY, DEPT, DESI, Salary
from EMP
RIGHT JOIN EMP_SAL
on EMP.EID = EMP_SAL.EID;

create table CJ1
(RNO int, NAME char(5));

insert into CJ1
values (1, 'Kapil'), (2, 'Rohan'), (3, 'Rajat'), (4, 'Amit'), (5, 'Mohit');

create table CJ2
(RNO int, Marks int);

insert into CJ2
values (1, 90), (2, 74), (3, 58), (10, 92), (11, 88);

select * from CJ1;
select * from CJ2;

select CJ1.RNO, NAME, Marks
from CJ1
INNER JOIN CJ2
on CJ1.RNO = CJ2.RNO;

select CJ1.RNO, NAME, Marks
from CJ1
LEFT JOIN CJ2
on CJ1.RNO = CJ2.RNO;

select CJ1.RNO, NAME, Marks
from CJ1
RIGHT JOIN CJ2
on CJ1.RNO = CJ2.RNO;

select CJ1.RNO, NAME, Marks
from CJ1
CROSS JOIN CJ2;

create table SJ
(ID int, NAME char(1), BOSSID int);

create table BOSS
(Bid int, NAME char(1));

insert into SJ
values (1, 'A', null), (2, 'B', 1), (3, 'C', 1), (4, 'D', 2), (5, 'E', 3), (6, 'F', 3), (7, 'G', 6);

insert into BOSS
values (1, 'A'), (2, 'B'), (3, 'C'), (6, 'F');

select * from SJ;

select SJ.ID, SJ.NAME, BOSS.NAME as BOSS_NAME
from SJ
LEFT JOIN BOSS
on SJ.BOSSID = BOSS.BID; 

-- SELF JOIN
select S1.ID, S1.NAME, S2.NAME as BOSS_NAME
from SJ S1
LEFT JOIN SJ S2
on S1.BOSSID = S2.ID; 

-- UNION JOIN
select CJ1.RNO, NAME, Marks
from CJ1
LEFT JOIN CJ2
on CJ1.RNO = CJ2.RNO
UNION
select CJ1.RNO, NAME, Marks
from CJ1
RIGHT JOIN CJ2
on CJ1.RNO = CJ2.RNO;

select CJ1.RNO, NAME, Marks
from CJ1
LEFT JOIN CJ2
on CJ1.RNO = CJ2.RNO
UNION ALL
select CJ1.RNO, NAME, Marks
from CJ1
RIGHT JOIN CJ2
on CJ1.RNO = CJ2.RNO;

-- INDEX
create index BI1 on EMP(City);
drop index BI1 on EMP;

-- Composite Index
create index BI1 on EMP(City, Addr);

-- IMPLICIT INDEX - Automatically created when Primary Key/ Unique is defined.
-- EXPLICIT INDEX - Created by the user

-- CLUSTERED INDEX (Automatically created if Primary Key is defined)
-- NON CLUSTERED INDEX

create view DAH_EMP as
(select * from EMP where Addr = 'Dahisar');

select * from DAH_EMP;

drop view DAH_EMP;
delete from EMP where EID = 'E0011';

create view DAH_EMP as
(select * from EMP where Addr = 'Dahisar') with check option;

insert into DAH_EMP values ('E0011', 'Saurabh', 'Borivali', 'Mumbai', '1996-10-22', '8850361577', 'msaurabh@gmail.com');

select count(*) from EMP;

select count(EID) from EMP_SAL;

select count(Salary) from EMP_SAL;

select max(Salary), min(Salary), sum(salary), avg(salary) from EMP_SAL;

select sqrt(25);

select rand();

select CONCAT('HELLO', " WORLD");

select * from EMP;

select EID, NAME, CONCAT(Addr, ', ', City) as 'Address' from EMP;

select ASCII('A');

SELECT left('WELCOME', 4);
SELECT right('WELCOME', 4);

select character_length('WELCOME');
SELECT lower('WELCOME');

select substr('WELCOME', 2,3);

select replace('LIFT', 'L', 'S');

select reverse('ABHI');

select insert('ABCDEFGH', 4, 3, 'XYZ');

select locate(' ','Abhishek Narayanan');

select EID, NAME, left(NAME, locate(' ', NAME)) as F_NAME from EMP_SAL;

select EID, NAME, right(NAME, (char_length(NAME) - locate(' ', NAME))) as L_NAME from EMP_SAL;

-- DATE FUNCTIONS
select current_date();

select adddate(current_date(), 10), adddate(current_date(), interval 4 month), adddate(current_date(), interval 3 year);

select EID, NAME, DOB, adddate(DOB, 90) as 'CONFIRMATION DATE' from EMP; 

select EID, NAME, DOB, datediff(current_date(), DOB)/365 as CURRENT_AGE from EMP;

select day(current_date()) as Day, month(current_date()) as Month, year(current_date()) as Year;

select * from EMP
where year(DOB) = 1996;