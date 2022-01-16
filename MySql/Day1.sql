create database datafolkz;
use datafolkz;
create table employee (name varchar(20), num int, address varchar(40), salary int);

insert into employee values ('meerabo', 1, 'gujarat',20000);
insert into employee values ('sandeep', 2, 'maha',30000);
insert into employee values ('ravi', 3, 'odissa',40000);

drop table employee;

select * from employee;

CREATE TABLE employee (eno int not null, enam varchar(20), age int, occupation varchar(20), PRIMARY KEY (eno));

describe employee;

alter table employee add column (location varchar(20));
describe employee;
                                
CREATE TABLE departments (deptno int, deptname varchar(20), location varchar(20));
alter table departments add column (eno int);
                 

describe employee;
insert into employee values (1,'md',32,'job','pune');
insert into employee values (2,'Hd',31,'job','mumbai');
alter table employee add column (department varchar(20));
describe employee;
select * from employee;

                                                   
alter table employee modify enam varchar(25);
insert into employee values (3,'Hdelmndnnnnnnnnnnnn',31,'job','hello','ec');
describe employee;
select * from employee;                                                   
update employee set enam='kd' where eno=3;
select * from employee;                          
describe departments;
                                                    
insert into departments values (2,'computer','maha',2);
insert into departments values (1,'ELECT','maha',2);
insert into departments values (3,'computer','maha',2);
insert into departments values (4,'EC','maha',2);
insert into departments values (5,'computer','maha',2);
insert into departments values (6,'computer','maha',2);
insert into departments values (7,'computer','maha',2);
insert into departments values (8,'Maths','maha',2);
select * from departments;
describe departments;
                                                    
select deptno, location from departments;
alter table departments add column doj date;
                                                    
describe departments;
insert into departments values (8,'Maths','maha',2, '2020-12-01');
select * from departments;
select deptno, location from departments order by deptno;
select * from departments order by deptno;
select * from departments order by deptno DESC;


rename table departments to dept; 
select * from dept;

                                                    
delete from dept where deptno = 8 and doj is NULL;
select * from dept;
                                                    
                                 
CREATE TABLE student (name varchar(10),adress varchar(10));
describe student;
                                                      
#drop student;  
#describe student;

select * from employee; 

select occupation from employee group by occupation; 



describe employee;
select * from employee;

insert into employee values (4,'PM',6,'student','pune','lkg');
insert into employee values (5,'DJ',64,'retired','Guj','it');

insert into employee (eno,enam) values (6,'temp');


