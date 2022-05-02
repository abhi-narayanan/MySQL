use learn8;

delimiter $$
create function MYSUM(X int, Y int)
returns int DETERMINISTIC
begin
	DECLARE Z int;
    set Z = X+Y;
	return Z; 
end; $$

select MYSUM(10,5);

$$
create function CAL(A int, B int, C char(1))
returns int DETERMINISTIC
begin
	DECLARE R int;
    
    if C = '+' then
		set R = A + B;
        
	elseif C = '-' then
		set R = A - B;
		set R = A - B;
        
	elseif C = '*' then
		set R = A * B;
        
	elseif C = '/' then
		set R = A / B;
        
	elseif C = '%' then
		set R = A % B;
        
	else
		set R = 0;
	
    end if;
		return R;
end $$ 

select CAL(2,4,'v');

$$
create function GEMAIL(N varchar(30), I char(5))
returns char(50) deterministic
begin
	declare L int;
    declare S int;
    declare ID varchar(50);
    declare LN varchar(20);
    
    set L = char_length(N);
    set S = locate(' ', N);
    set LN = RIGHT(N, L-S);
    set ID = upper(concat(left(N,1), LN, right(I,4), '@OUTLOOK.COM'));
    
    return ID;
end;
delimiter ;

select GEMAIL('ABHI NARAYANAN', 'E0001');

select EID, NAME, GEMAIL(NAME, EID) as 'CORP_EMAIL' from demo.EMP;

use DEMO;

select * from EMP;
select * from EMP_SAL;

select EMP.EID, EMP.NAME, ADDR
from EMP
inner join EMP_SAL
on EMP.EID = EMP_SAL.EID
where DESI = 'Manager';

select EID, NAME, ADDR
from EMP
where EID in ('E0005', 'E0006');

-- SUB Query
select EID, NAME, ADDR
from EMP
where EID in (select EID from EMP_SAL where DESI = 'Manager');

select EID, DEPT, DESI, SALARY
from EMP_SAL
where EID IN (select EID from EMP where ADDR = 'Dahisar');

create table TRAINING
(EID char(5),
Name varchar(30),
DEPT varchar(10),
Module varchar(10));

-- INSERT Sub Query
insert into TRAINING (EID, NAME, DEPT)
(select EMP.EID, EMP.NAME, DEPT
from EMP
inner join EMP_SAL
on EMP.EID = EMP_SAL.EID
where DEPT = 'IT');

select * from TRAINING;

update TRAINING set module = 'SQL';

-- DELETE Sub Query
delete from TRAINING
where EID in (select EID from EMP_SAL where DESI = 'Manager');

select EID, NAME, Salary from EMP_SAL
where EID in (select EID from EMP where ADDR = 'Dahisar');

-- Update Sub Query
update EMP_SAL set Salary = Salary + 10000
where EID in (select EID from EMP where ADDR = 'Dahisar');

-- EXISTS - If the inner query returns something, the outer query will work.
select * from EMP_SAL
where DEPT = 'HR' and EXISTS (select * from EMP_SAL where Salary > 50000 AND DEPT = 'HR');

-- STORED PROCEDURE
delimiter $$
create procedure DAH_EMP()
begin
	select * from EMP where ADDR = 'Dahisar';

end;
$$

delimiter ;

call DAH_EMP;
drop procedure DAH_EMP;

delimiter $$
create procedure DAH_EMP(X varchar(20))
begin
	select * from EMP
    where ADDR = X;
end;
$$

delimiter ;

call DAH_EMP('Malad');

delimiter $$
create procedure DAH_EMP(X varchar(20))
begin
	select EMP.EID, EMP.Name, CITY, DOB, DEPT, DESI, Salary as 'Basic', Salary*0.15 as "HRA"
    from EMP
    inner join EMP_SAL
    on EMP.EID = EMP_SAL.EID
    where ADDR = X;
end;
$$

delimiter ;

call DAH_EMP('Dahisar');

select * from EMP;

insert into EMP
values('E0011', 'Rahul', 'Goregaon', 'Patna', '1987-07-31', 8863224785, 'rahulm@gmail.com');

delimiter $$
create procedure TAB_SHOW(X varchar(20))
begin 
	select * from X;
end;
$$
delimiter ;

use learn8;

create table test
(ID int,
Name varchar(10));

insert into test 
values(1, 'A'), (2, 'B'), (3, 'C'), (4, 'D'), (5, 'E'), (6, 'F'), (7, 'G'), (8, 'H'), (9, 'I'), (10, 'J');

select * from test;

delete from test where ID = 10;
rollback;

start transaction;

delete from test where ID = 9;
delete from test where ID = 8;

savepoint T1;

delete from test where ID = 7;
delete from test where ID = 6;

select * from test;

rollback to savepoint T1;

delete from test where ID = 9;
commit;

rollback;

drop table test;

SHOW VARIABLES LIKE 'auto_inc%';

-- Difference between two consecutive increments 
SET @@auto_increment_increment=10;
-- Start value of the increment
SET @@auto_increment_offset=5;

create table test
(ID int auto_increment,
Name varchar(10),
primary key (ID));

insert into test(Name)
values ('Abhi');

select * from test;

insert into test(Name)
values ('Anu');

insert into test
values (40, 'Abhi');

insert into test(Name)
values ('Sauda');

delete from test
where ID = 45;

insert into test(Name)
values ('Mom');
