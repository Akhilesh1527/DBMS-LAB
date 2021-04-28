create database book_dealer;
show databases;
use book_dealer;
show tables;
create table author(
author_id int,
name varchar(20),
city varchar(20),
country varchar(20),
primary key(author_id));
create table publisher(
publisher_id int,
name varchar(20),
city varchar(20),
country varchar(20),
primary key(publisher_id));
create table catalog(
price int,
book_id int,
title varchar(30),
author_id int,
publisher_id int,
category_id int,
year int,
primary key(book_id),
foreign key(author_id) references author(author_id),
foreign key(publisher_id) references publisher(publisher_id),
foreign key(category_id) references category(category_id));
create table category(
category_id int,
description varchar(30),
primary key(category_id));
 create table order_details(
order_no int,
book_id int,
quantity int,
primary key(order_no),
foreign key(book_id) references catalog(book_id));
insert into author values (1001,'TERAS CHAN','CA','USA');
insert into author values (1002,'STEVENS','ZOMBI','UGANDA');
insert into author values (1003,'M MANO','CAIR','CANADA');
insert into author values (1004,'KARTHIK B.P.','NEW YORK','USA');
insert into author values (1005,'WILLIAM STALLINGS','LAS VEGAS','USA');
commit;
select * from author;
insert into publisher values (1,'PEARSON','NEW YORK','USA');
insert into publisher values (2,'EEE','NEW SOUTH VALES','USA');
insert into publisher values (3,'PHI','DELHI','INDIA');
insert into publisher values (4,'WILLEY','BERLIN','GERMANY');
insert into publisher values (5,'MGH','NEW YORK','USA');
commit;
select * from publisher;
insert into catalog values (251,11,'Unix System Prg',1001,1,1001,2000);
insert into catalog values (425,12,'Digital Signals',1002,2,1003,2001);
insert into catalog values (225,13,'Logic Design',1003,3,1002,1999);
insert into catalog values (333,14,'Server Prg',1004,4,1004,2001);
insert into catalog values (326,15,'Linux OS',1005,5,1005,2003);
insert into catalog values (526,16,'C++ Bible',1005,5,1001,2000);
insert into catalog values (658,17,'COBOL Handbook',1005,4,1001,2000);
commit;
select * from catalog;
insert into category values (1001,'COMPUTER SCIENCE');
insert into category values (1002,'ALGORITHM DESIGN');
insert into category values (1003,'ELECTRONICS');
insert into category values (1004,'PROGRAMMING');
insert into category values (1005,'OPERATING SYSTEMS');
commit;
select * from category;
insert into order_details values (1,11,5);
insert into order_details values (2,12,8);
insert into order_details values (3,13,15);
insert into order_details values (4,14,22);
insert into order_details values (5,15,3);
insert into order_details values (6,17,10);
commit;
select * from order_details;
 select count(*) from author where author_authorid in(select author_id from catalog where year>2000 and price>2000);
 select title,price,1.10*price as new_price from CATALOG;
 select name,city,country from AUTHOR join CATALOG ON author-id=author-id where year>2000; 

 select avg(price) from catalog;         
select title,price from CATALOG where price<500;
select title,price from CATALOG where price between 400 and 500;
select title,year from catalog where year>2000;
select title,price from CATALOG where price!=(select max(price)from CATALOG);
select name,country from author where country='CANADA';
select author_id,name,city,country from author
where author_id in(select author_id from catalog 
where year=2000 group by author_id having count(author_id) >=2   );
select a.name from author a,catalog c,order_details o
where a.author_id=c.author_id and c.book_id=o.book_id
and o.quantity=(select max(quantity) from order_details);
 select name from author a,catalog c where a.author_id=c.author_id and book_id in 
 (select book_id from order_details where quantity=(select max(quantity) from order_details));

