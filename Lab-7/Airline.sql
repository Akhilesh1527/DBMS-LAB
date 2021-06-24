create database airline;
show databases;
use airline;
create table flights(flno int,frm varchar(20),too varchar(20),distance int,departs time,arrives time,
price int,primary key(flno));
create table aircraft(aid int,aname varchar(20),cruisingrange int,
primary key(aid));
create table employee(eid int,ename varchar(20),salary int,
primary key(eid));
create table certified(eid int,aid int,primary key(aid,eid),
foreign key(aid) references aircraft(aid),
foreign key(eid) references employee(eid));
insert into flights values(1,'Bangalore','Mangalore',360,'10:45:00','12:00:00',10000);
insert into flights values(2,'Bangalore','Delhi',5000,'12:15:00','04:30:00',25000);
insert into flights values(3,'Bangalore','Mumbai',3500,'02:15:00','05:25:00',30000);
insert into flights values(4,'Delhi','Mumbai',4500,'10:15:00','12:05:00',35000);
insert into flights values(5,'Delhi','Frankfurt',18000,'07:15:00','05:30:00',90000);
insert into flights values(6,'Bangalore','Frankfurt',19500,'10:00:00','07:45:00',95000);
select * from flights;
insert into aircraft values(123,'Airbus',1000);
insert into aircraft values(302,'Boeing',5000);
insert into aircraft values(306,'Jet01',5000);
insert into aircraft values(378,'Airbus380',8000);
insert into aircraft values(456,'Aircraft',500);
insert into aircraft values(123,'Airbus',1000);
select * from aircraft;
insert into employee values(1,'Ajay',30000);
insert into employee values(2,'Ajith',85000);
insert into employee values(3,'Arnab',50000);
insert into employee values(4,'Harry',45000);
insert into employee values(5,'RON',90000);
insert into employee values(6,'JOSH',75000);
select * from employee;
insert into certified values(1,123);
insert into certified values(2,123);
insert into certified values(1,302);
insert into certified values(5,302);
insert into certified values(1,306);
select * from certified;

select distinct(A.aname) from aircraft A inner join certified C on A.aid=C.aid inner join Employee E on E.eid=C.eid
where salary>=80000;


select max(A.cruisingrange),E.eid from aircraft A inner join certified C on A.aid=C.aid inner join Employee E on E.eid=C.eid
group by eid having count(E.eid)>2;


select ename from employee where salary <
(select min(price) from flights where frm='bangalore' and too='frankfurt');


select A.aname,avg(E.salary) from aircraft A inner join certified C on A.aid=C.aid inner join Employee E on E.eid=C.eid where A.cruisingrange>1000
group by(A.aid);


select ename from aircraft A inner join certified C on A.aid=C.aid inner join Employee E on E.eid=C.eid
where A.aname like 'boeing%';


select aid from AIRCRAFT where cruisingrange>=(select distance from flights where frm='bangalore' and too='delhi');


select ename from employee where eid not in(select eid from certified) and salary>(select avg(salary) 
from employee where eid in(select eid from certified));
