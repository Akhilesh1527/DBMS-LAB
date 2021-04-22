create database insurance;
show databases;
use insurance;
show tables;
create table person(driver_id varchar(10),name varchar(20),address varchar(15),primary key(driver_id));
create table CAR(reg_no varchar(30),model varchar(30),year date,primary key(reg_no));
create table ACCIDENT(rep_no int,a_date date,location varchar(30),PRIMARY KEY(rep_no));
create table OWNS(driver_id varchar(10),reg_no varchar(30),primary key(driver_id,reg_no);
foreign key(driver_id)references person(driver_id) on delete cascade;
foreign key(reg_no)references CAR(reg_no) on delete cascade;
create table participted(driver_id varchar(10),reg_no varchar(30),rep_no int,dmg_amt int,
primary key(driver_id),foreign key(driver_id) references OWNS(driver_id) on delete cascade,
foreign key(reg_no) references OWNS(reg_no) on delete cascade, 
foreign key(rep_no) references ACCIDENT(rep_no) on delete cascade);
show tables;
insert into person(driver_id,name,address)values(1111,'RAMU','K.S.LAYOUT');
commit;
select * from person;
insert into person values(2222,'JOHN','INDIRANAGAR');
insert into person values(3333,'PRIYA','JAYANAGAR');
insert into person values(4444,'GOPAL','WHITEFIELD');
insert into person values(5555,'LATHA','VIJAYNAGAR');
commit;
select * from person;

insert into CAR values('KA04Q2301','MARUTHI-DX',2000);
insert into CAR values('KA05P1000','FORDICON',2000);
insert into CAR values('KA03L1234','ZEN-VXI',1999);
insert into CAR values('KA03L9999','MARUTH-DX',2002);
insert into CAR values('KA01P4020','INDICA-VX',2002);
commit;
select * from car;

insert into ACCIDENT values(12,'1996-06-01','M G ROAD');
insert into ACCIDENT values(200,'2002-12-10','DOUBLEROAD');
insert into ACCIDENT values(300,'1999-07-23','M G ROAD');
insert into ACCIDENT values(25000,'2000-06-11','RESIDENCY ROAD');
insert into ACCIDENT values(26500,'2001-10-16','RICHMOND ROAD');
commit;
select * from ACCIDENT;

insert into OWNS values ('1111','KA04Q2301');
insert into OWNS values ('1111','KA05P1000');
insert into OWNS values ('2222','KA03L1234');
insert into OWNS values ('3333','KA03L9999');
insert into OWNS values ('4444','KA01P4020');
commit;
select * from OWNS;

insert into participted values('1111','KA04Q2301',12,20000);
insert into participted values('2222','KA03L1234',200,500);
insert into participted values('3333','KA03L9999',300,10000);
insert into participted values('4444','KA01P4020',25000,2375);
commit;
select * from participted;

select count(*) from ACCIDENT where a_date like '1999-__-__';
update participted set dmg_amt=25000 where rep_no=12 and reg_no='KA04Q2301';
commit;
select * from participted;

select count(A.rep_no)from ACCIDENT A,participted P,CAR C where A.rep_no=P.rep_no and P.reg_no=C.reg_no and C.model='MARUTHI-DX';
select *from insurance.person;
select *from insurance.ACCIDENT;
select *from insurance.CAR;
select *from insurance.OWNS;
select *from insurance.participted;
