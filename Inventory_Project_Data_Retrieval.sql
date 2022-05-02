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
	insert into ORDERS
    values (A, E, B, C, D);
    
    select * from ORDERS where OID = A;
end;

$$
delimiter ;

call ADDORDER('O0006', 'C0004', 'P0008', 5);