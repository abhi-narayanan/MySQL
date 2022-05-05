use INVENTORY;

select * from SUPPLIER;

-- PROCEDURE to ADD new entry into the Supplier Table
delimiter $$

create procedure ADDSUPPLIER(A char(5), B varchar(20), C varchar (20), D varchar (10), E char(10), F varchar(25))
begin
	insert into SUPPLIER
    values (A, B, C, D, E, F);
    
    select * from SUPPLIER where SID = A;
end;

$$
delimiter ;

call ADDSUPPLIER('S0006', 'PC Parts Solutions', 'Shop 1, Rose Baug', 'Delhi', '9575428796', 'sales@pcparts.in');


select * from Product;

-- PROCEDURE to ADD new entry into the Product Table
delimiter $$

create procedure ADDPRO(A char(5), B varchar(20), C int, D char (2), E char(5))
begin
	
	insert into PRODUCT
    values (A, B, C, D, E);
    
    select * from PRODUCT where PID = A;
end;

$$
delimiter ;

call ADDPRO('P0017', 'Earphones', 300, 'IT', 'S0005');

select * from CUST;

-- PROCEDURE to ADD new entry into the Customer Table
delimiter $$

create procedure ADDCUST(A char(5), B varchar(20), C varchar(20), D varchar (10), E char(10), F varchar(20), G date)
begin
	
	insert into CUST
    values (A, B, C, D, E, F, G);
    
    select * from CUST where CID = A;
end;

$$
delimiter ;

call ADDCUST('C0009', 'Saurabh Mehta', 'Suyog Apts', 'Mumbai', '8035941238', 'msau@outook.com', '1996-04-25');

select * from ORDERS;

-- PROCEDURE to ADD new entry into the Order Table
delimiter $$

create procedure ADDORDER(A char(5), B char(5), C char(5), D int)
begin
	declare E date;
    set E = current_date();
	
    if D <= (select SQTY from STOCK where PID = C) then
		insert into ORDERS
		values (A, E, B, C, D);
        select 'Order was placed.';
        select * from ORDERS where OID = A;
	
    else
		select 'Order was not placed. Insufficient stock.';
    
	end if;
    
end;

$$
delimiter ;

drop procedure ADDORDER;

call ADDORDER('O0009', 'C0001', 'P0006', 10);

show triggers;
select * from ORDERS;

delimiter $$

create trigger before_orders_insert before insert
on ORDERS
for each row
begin
	update STOCK set SQTY = SQTY - new.OQTY
    where PID = new.PID;
end $$

delimiter ;
drop trigger before_orders_insert;
select * from ORDERS;

select * from STOCK;

call ADDORDER('O0010', 'C0003', 'P0004', 20);
