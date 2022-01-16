use datafolkz;

create table empdetails (empno int, empname varchar(20), DOJ date, salary int, designation varchar(20));

alter table empdetails ADD PRIMARY KEY(empno);

insert into empdetails values (1,'Hd','2020-01-01',10000,'teacher');
insert into empdetails values (2,'md','2020-01-02',10000,'admin');
insert into empdetails values (3,'gd','2020-01-03',10000,'principal');
insert into empdetails values (4,'gd','2020-01-04',50000,'principal');
insert into empdetails values (5,'damd','2020-01-02',30000,'admin');

describe empdetails;

select empno, empname from empdetails;

select empno,empname,salary from empdetails order by empname;
select * from empdetails order by empname;

select DESIGNATION, AVG(salary) from empdetails GROUP BY designation;

select min(salary),max(salary),avg(salary),sum(salary) from empdetails;

# Wild card select 

select * from empdetails where designation like '_dmin';
select * from empdetails where designation like '%in%';

#  Sub Queries 

select salary,empname from empdetails where salary = (select min(salary) from empdetails);

/*
1.create a table called employee(empno,ename,gender,deptno,salary,comm)
2.create a table dept(deptno,deptname,location)
3.display the records accroding to the deptname wise using dept table
4.display the records whose salary is max with name starting with s
5.dispaly the records in dept according the location wise
*/

#1.create a table called employee(empno,ename,gender,deptno,salary,comm)

CREATE TABLE emp (
	empno INT (11) PRIMARY KEY,
	ename VARCHAR (20) DEFAULT NULL,
	gender VARCHAR (25) NOT NULL,
    deptno INT(11) NOT NULL,
	salary DECIMAL (8, 2) NOT NULL,
	COMM INT (11) NOT NULL
);

INSERT INTO emp VALUES (100,'Steven','Male',4,24000.00,1200);
INSERT INTO emp VALUES (101,'Neena','Female',5,17000.00,100);
INSERT INTO emp VALUES (102,'Lex','Male',5,17000.00,1000);
INSERT INTO emp VALUES (103,'Alexander','Male',9,9000.00,1026);
INSERT INTO emp VALUES (104,'Bruce','Female',9,6000.00,1036);
INSERT INTO emp VALUES (105,'suman','Female',10,96000.00,1100);
INSERT INTO emp VALUES (106,'piku','Male',10,100000.00,110);
INSERT INTO emp VALUES (107,'sinu','Male',11,96000.00,1210);
INSERT INTO emp VALUES (108,'Tinu','Female',12,96000.00,120);

#2.create a table dept(deptno,deptname,location)

CREATE TABLE depart (
	deptno INT (11) PRIMARY KEY,
	deptname VARCHAR (30) NOT NULL,
	location VARCHAR (30) DEFAULT 'GUJARAT'
);

INSERT INTO depart VALUES (1,'Administration','Pune');
INSERT INTO depart VALUES (2,'Marketing','Delhi');
INSERT INTO depart VALUES (3,'Purchasing','Hyderabad');
INSERT INTO depart VALUES (4,'Human Resources','pune');
INSERT INTO depart VALUES (5,'Shipping','Mumbai');
INSERT INTO depart VALUES (6,'IT','Delhi');


#3.display the records accroding to the deptname wise using dept table

select deptname from depart group by deptname;

#4.display the records whose salary is max with name starting with s

SELECT MAX(salary) FROM emp where ename like 's%';
select * from emp where salary = (SELECT MAX(salary) FROM emp where ename like 's%');

#5.dispaly the records in dept according the location wise

select location,count(*) from depart group by location;

show tables;

SELECT table_name, table_type, engine, TABLE_COMMENT
FROM information_schema.tables
Where TABLE_SCHEMA = 'mysql'
order by engine desc;


