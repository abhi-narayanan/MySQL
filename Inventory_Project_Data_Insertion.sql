create database INVENTORY;

use INVENTORY;

insert into SUPPLIER
values ('S0001', 'Cloudtail India', 'Sector 103, Charkop', 'Mumbai', '8752468357', 'supplier@cloudtail.in'),
('S0002', 'Appario Retailors', 'Block 12, Hauz Khas', 'Delhi', '9774196357', 'supplier@appario.in'),
('S0003', 'Gunmetal Suppliers', 'Sector 32, Prem Puri', 'Gurugram', '9952178540', 'orders@gunmetal.in'),
('S0004', 'Dell Technologies', 'Shantala Nagar', 'Bengaluru', '7256842378', 'supplier@dell.in'),
('S0005', 'Dawntech Electronics', 'New Kolkata Market', 'Kolkata', '6821875620', 'vendor@dawntech.in');

insert into CUST
values ('C0001', 'Anushka Malkar', 'Om Yogesh, Dahisar', 'Udupi', 8879154862, 'amalkar@gmail.com', '1999-02-22'),
('C0002', 'Abhishek Narayanan', 'Parab, Dahisar', 'Mumbai', 8082155478, 'an@gmail.com', '1996-12-02'),
('C0003', 'Ajay Patel', 'T Nagar, Boisar', 'Allahabad', 7668813250, 'apatel@gmail.com', '1996-08-21'),
('C0004', 'Rhishikesh Ludbe', 'Shivaji Park, Dadar', 'Malvan', 9092632729, 'rhishi@gmail.com', '1997-07-03'),
('C0005', 'Dhruv Joshi', 'Shivdham, Malad', 'Baroda', 9919500345, 'dj@gmail.com', '1999-09-07'),
('C0006', 'Aaron DSouza', 'Classic V, Dahisar', 'Pune', 8000154862, 'aconti@gmail.com', '1991-07-23'),
('C0007', 'Jitesh Salve', 'Sai Palace, Charkop', 'Toll', 7770024853, 'sunnys@gmail.com', '1999-04-08'),
('C0008', 'Harish Puro', 'One Heights, Dahisar', 'Goa', 9647821933, 'harishp@gmail.com', '1992-10-15');

insert into PRODUCT
values ('P0001', 'Glucometer', '700', 'HC', 'S0001'),
('P0002', 'BP Monitor', '2000', 'HC', 'S0001'),
('P0003', 'Steamers', '300', 'HC', 'S0001'),
('P0004', 'Nebulizers', '1000', 'HC', 'S0001'),
('P0005', 'Weigh Scale', '500', 'HC', 'S0001'),
('P0006', 'Monitor', '13000', 'IT', 'S0004'),
('P0007', 'Mouse', '700', 'IT', 'S0004'),
('P0008', 'Keyboard', '900', 'IT', 'S0005'),
('P0009', 'Motherboard', '4000', 'IT', 'S0005'),
('P0010', 'Processor', '8000', 'IT', 'S0004'),
('P0011', 'Controller', '1200', 'IT', 'S0004'),
('P0012', 'Grinder', '2200', 'HA', 'S0003'),
('P0013', 'Microwave', '3500', 'HA', 'S0003'),
('P0014', 'Refrigerator', '22000', 'HA', 'S0002'),
('P0015', 'Geyser', '4000', 'HA', 'S0002'),
('P0016', 'Air Conditioner', '30000', 'HA', 'S0002');

insert into ORDERS
values ('O0001', '2018-12-25', 'C0002', 'P0007', 1),
('O0002', '2019-01-10', 'C0001', 'P0003', 1),
('O0003', '2019-04-18', 'C0006', 'P0001', 10),
('O0004', '2019-09-12', 'C0005', 'P0011', 2),
('O0005', '2020-03-15', 'C0003', 'P0016', 3);

insert into STOCK
values ('P0001', 100, 10, 20),
('P0002', 50, 5, 10),
('P0003', 1000, 100, 200),
('P0004', 20, 2, 5),
('P0005', 100, 5, 20),
('P0006', 150, 10, 30),
('P0007', 300, 50, 75),
('P0008', 120, 10, 20),
('P0009', 250, 50, 30),
('P0010', 80, 5, 10),
('P0011', 170, 20, 20),
('P0012', 100, 20, 40),
('P0013', 350, 50, 100),
('P0014', 1000, 100, 10),
('P0015', 170, 25, 10),
('P0016', 700, 50, 10);






