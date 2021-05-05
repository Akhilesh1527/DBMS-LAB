create database order_processing;
show databases;
use order_processing;
create table customer(
cust_no int,
cname varchar(20),
city varchar(20),
primary key(cust_no)
);
create table cust_order(
order_no int,
odate date,
cust_no int,
ord_amt int,
primary key(order_no),
foreign key(cust_no) references customer(cust_no)
);
create table item(
items int,
unit_price int,
primary key(items)
);
create table order_items(
order_no int,
items int,
qty int,
foreign key(order_no) references cust_order(order_no),
foreign key(items) references item(items)
);
create table warehouse(
warehouse_no int,
city varchar(20),
primary key(warehouse_no)
);
create table shipment(
order_no int,
warehouse_no int,
ship_date date,
foreign key(order_no) references cust_order(order_no),
foreign key(warehouse_no) references warehouse(warehouse_no)
);
insert into customer values (771,'PUSHPA K','BANGALORE');
insert into customer values (772,'SUMAN','MUMBAI');
insert into customer values (773,'SOURAV','CALICUT');
insert into customer values (774,'LAILA','HYDERABAD');
insert into customer values (775,'FAIZAL','BANGALORE');
commit;
select * from customer;
insert into cust_order values (111,'22-01-02',771,18000);
insert into cust_order values (112,'30-07-02',774,6000);
insert into cust_order values (113,'03-04-03',775,9000);
insert into cust_order values (114,'03-09-03',775,29000);
insert into cust_order values (115,'10-12-03',773,29000);
insert into cust_order values (116,'19-08-04',772,56000);
insert into cust_order values (117,'10-09-04',771,20000);
insert into cust_order values (118,'20-11-04',775,29000);
insert into cust_order values (119,'13-02-05',774,29000);
insert into cust_order values (120,'13-10-05',775,29000);
commit;
select * from cust_order;
insert into item values (5001,503);
insert into item values (5002,750);
insert into item values (5003,150);
insert into item values (5004,600);
insert into item values (5005,890);
commit;
select * from item;
insert into order_items values (111,5001,50);
insert into order_items values (112,5003,20);
insert into order_items values (113,5002,50);
insert into order_items values (114,5005,60);
insert into order_items values (115,5004,90);
insert into order_items values (116,5001,10);
insert into order_items values (117,5003,80);
insert into order_items values (118,5002,50);
insert into order_items values (119,5005,10);
insert into order_items values (120,5004,45);
commit;
select * from order_items;
insert into warehouse values (1,'DELHI');
insert into warehouse values (2,'BOMBAY');
insert into warehouse values (3,'CHENNAI');
insert into warehouse values (4,'BANGALORE');
insert into warehouse values (5,'BANGALORE');
insert into warehouse values (6,'DELHI');
insert into warehouse values (7,'BOMBAY');
insert into warehouse values (8,'CHENNAI');
insert into warehouse values (9,'DELHI');
insert into warehouse values (10,'BANGALORE');
commit;
select * from warehouse;
insert into shipment values (111,1,10-02-02);
insert into shipment values (112,5,10-09-02);
insert into shipment values (113,8,10-02-03);
insert into shipment values (114,3,10-12-03);
insert into shipment values (115,9,19-01-04);
insert into shipment values (116,1,20-09-04);
insert into shipment values (117,5,10-09-04);
insert into shipment values (118,7,30-11-04);
insert into shipment values (119,7,30-04-05);
insert into shipment values (120,6,21-12-05);
commit;
select * from shipment;

select C.cname,COUNT(O.order_no),avg(O.ord_amt)
from customer C,cust_order O 
where C.cust_no=O.cust_no group by O.cust_no;

select o.order_no from cust_order o, warehouse w, shipment s 
where o.order_no=s.order_no and s.warehouse_no=w.warehouse_no and w.city='DELHI';


delete from item where items=5003 ;

