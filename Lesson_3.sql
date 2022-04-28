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
        
        

        
        