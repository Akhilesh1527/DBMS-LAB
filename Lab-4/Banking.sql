create database banking;
show databases;
use banking;
show tables;
create table branch(
branch_name varchar(20), 
branch_city varchar(20),
assets real,
primary key(branch_name)
);
create table account(
accno int,
branch_name varchar(20),
balance real,
primary key(accno),
foreign key (branch_name) references branch(branch_name)
);
create table depositor(
customer_name varchar(20),
customer_street varchar(20),
customer_city varchar(20),
primary key(customer_name)
);
create table loan(
loan_number int,
branch_name varchar(20),
amount real,
foreign key (branch_name) references branch(branch_name)
);
create table borrower(
customer_name varchar(20),
loan_number int,
primary key(loan_number),
foreign key(customer_name)references depositor(customer_name),
foreign key(loan_number)references loan(loan_number)
);
create table customer(
customer_name varchar(20),
accno int,
primary key(customer_name ,accno),
foreign key (accno) references accounts(accno) on delete cascade on update cascade,
foreign key (customer_name) references customer(customer_name) on delete cascade on update
cascade);

insert into branch values ('SBI PD NAGAR','CHENNAI',200000);
insert into branch values ('SBI RAJAJI NAGAR','MUMBAI',500000);
insert into branch values ('SBI JAYANAGAR','DELHI',660000);
insert into branch values ('SBI VIJAY NAGAR','BANGALORE',870000);
insert into branch values ('SBI HOSAKEREHALLI','HYDERABAD',550000);
commit;
select * from branch;
insert into account values (1234602,'SBI HOSAKEREHALLI',5000);
insert into account values (1234603,'SBI VIJAY NAGAR',5000);
insert into account values (1234604,'SBI JAYANAGAR',5000);
insert into account values (1234605,'SBI RAJAJI NAGAR',10000);
insert into account values (1234503,'SBI VIJAY NAGAR',40000);
insert into account values (1234504,'SBI PD NAGAR',4000);
commit;
select * from account;
insert into depositor values ('KEZAR','M G ROAD','DELHI');
insert into depositor values ('LAL KRISHNA','ST MKS ROAD','BANGALORE');
insert into depositor values ('RAHUL','AUGSTEN ROAD','HYDERABAD');
insert into depositor values ('LALLU','V S ROAD','MUMBAI');
insert into depositor values ('FAIZAL','RESEDENCY ROAD','CHENNAI');
insert into depositor values ('RAJEEV','DICKNSN ROAD','RAJASTHAN');
commit;
select * from depositor;
insert into loan values (10011,'SBI JAYANAGAR',10000);
insert into loan values (10012,'SBI VIJAY NAGAR',5000);
insert into loan values (10013,'SBI HOSAKEREHALLI',20000);
insert into loan values (10014,'SBI PD NAGAR',15000);
insert into loan values (10015,'SBI RAJAJI NAGAR',25000);
commit;
select * from loan;
insert into borrower values ('KEZAR',10011);
insert into borrower values ('LAL KRISHNA',10012);
insert into borrower values ('RAHUL',10013);
insert into borrower values ('LALLU',10014);
insert into borrower values ('LAL KRISHNA',10015);
commit;
select * from borrower;
insert into customer values ('KEZAR',1234602);
insert into customer values ('LAL KRISHNA',1234603);
insert into customer values ('RAHUL',1234604);
insert into customer values ('LALLU',1234605);
insert into customer values ('FAIZAL',1234503);
insert into customer values ('RAJEEV',1234604);
commit;
select * from customer;


SELECT customer_name
            FROM customer c,account a
            WHERE c.accno=a.accno
            AND a.branch_name='SBI VIJAY NAGAR'
            GROUP BY c.customer_name
            HAVING COUNT(c.customer_name)>=1;
            
 SELECT customer_name 
FROM branch b, account a, customer c
WHERE b.branch_name = a.branch_name AND 
      a.accno = c.accno AND 
      b.branch_city = 'BANGALORE' 
GROUP BY customer_name HAVING COUNT( DISTINCT(b.branch_name)) = ( SELECT COUNT(branch_name) 
          FROM branch WHERE branch_city ='BANGALORE');  
          
SELECT * FROM account ; 
DELETE FROM account 
WHERE branch_name IN (SELECT branch_name FROM branch WHERE branch_city = 'BANGALORE');
SELECT * FROM account ;
            
