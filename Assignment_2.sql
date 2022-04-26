use DEMO;

create table EMP_SAL
(EID char(5), NAME varchar(20), DEPT varchar(10), DESI varchar(15), DOJ Date, Salary int);

insert into EMP_SAL
values ('E0001', 'Abhishek Narayanan','IT', 'Data Scientist', '1996-12-02', 250000),
('E0002', 'Rohit Sharma', 'Finance', 'CA', '1999-9-05', 160000),
('E0003', 'Anushka Malkar', 'Management', 'Director', '1969-05-21', 500000),
('E0004', 'Paul Rudd', 'HR', 'Recruiter', '1979-11-23', 100000),
('E0005', 'Logan Pierce', 'Marketing', 'Manager', '1990-02-28', 120000),
('E0006', 'Lewis Hamilton', 'Production', 'Manager', '1985-08-16', 250000),
('E0007', 'Kuldeep Sharma', 'Sales', 'Demo Expert', '1994-07-10', 85000);

select * from EMP_SAL;

select * from EMP_SAL
where NAME LIKE '%Sharma';

update EMP_SAL set Salary = Salary*1.1
where DESI = 'Manager';

select DEPT, DESI, sum(Salary) as 'Total Cost', count(EID) as Count
from EMP_SAL
group by DEPT, DESI;

select DEPT, sum(Salary) as 'Total Cost'
from EMP_SAL
group by DEPT
having sum(Salary) >= 200000;

select DESI, sum(Salary) as 'Total_cost', count(EID) as Total_No
from EMP_SAL
group by DESI
order by sum(Salary) desc;