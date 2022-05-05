use demo;

select * from EMP;
select * from EMP_SAL;

select avg(Salary) from EMP_SAL
where DEPT = 'HR';

select * from EMP_SAL
where Salary >= (select AVG(Salary) from EMP_SAL 
where DEPT = 'HR') and DEPT = 'HR';

SET @@auto_increment_increment=1;
SET @@auto_increment_offset=1;

delimiter $$

create function GENID(C char(1), X int)
returns char(5) deterministic
begin
	declare ID char(5);
    
    select ID, case
		when x < 10 then concat(C, '000', X)
        when x < 100 then concat(C, '00', X)
        when x < 1000 then concat(C, '0', X)
        when x < 10000 then concat(C, X)
        else NULL
	end;
end;
$$

delimiter ;

use learn8;

create table PRODUCT
(PID char(5), 
PDESC char(20) NOT NULL,
PRICE int);

create table STOCK
(SID char(5),
SQTY int);

create table ORDERS
(OID char(5),
CID char(5),
PID char(5),
QTY int);

insert into PRODUCT
values ('P0001', 'DELL MOUSE', 350),
('P0002', 'DELL KEYBOARD', 590),
('P0003', 'SAMSUNG LED MONITOR', 6500),
('P0004', '8GB DDR4 RAM', 2700),
('P0005', 'HP LAPTOP', 67000);

insert into STOCK
values ('P0001', 200),
('P0002', 100),
('P0003', 100),
('P0004', 100),
('P0005', 50);

insert into ORDERS
values ('O0001', 'C0001','P0002', 50);

delimiter $$
create trigger STOCK_TALLY
before insert on ORDERS
for each ROW
begin
	update STOCK
	set SQTY = SQTY - (select QTY from ORDERS)
    where SID = (select PID from ORDERS);
end;
$$

delimiter ;

drop trigger STOCK_TALLY;

select * from ORDERS;
select * from STOCK;
select * from PRODUCT;

delete from ORDERS where OID = 'O0001';

delimiter $$
create trigger TR_DELL_PRO
after delete on PRODUCT
for each ROW
begin
	delete from STOCK
    where SID = (select PID from PRODUCT);
end;

$$
delimiter ;

drop trigger TR_DELL_PRO;
delete from PRODUCT
where PID = 'P0005';

use mysql;
show tables;

select * from user;
