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


