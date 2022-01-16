/*					Assignment -2 					*/

# create database datafolkz;
use datafolkz;

create table employeeData (empId int primary key not null,firstName varchar(20), lastName varchar(20), salary int, DOJ datetime, Department varchar(20) );
insert into employeeData values (1, 'Madhuri', 'Sripada', 100000, '19-02-01 09.00.00','HR'),(2, 'Haritha', 'Verma', 80000, '19-01-10 09.00.00','Admin'),(3, 'Vimal', 'Rao', 300000, '19-03-10 09.00.00','HR'),(4, 'Amrita', 'Prasad', 500000, '19-03-10 09.00.00', 'Admin'),(5, 'Vidhi', 'Agarwal', 500000, '19-02-11 09.00.00','Admin'),(6, 'Nitya', 'Prasad', 200000, '19-02-11 09.00.00','Account'),(7, 'Sravan', 'Kumar', 75000, '19-04-20 09.00.00','Account'),(8, 'Girish', 'Varma', 90000, '19-04-11 09.00.00','Admin');

create table incentivesData (iId int, incentive int, IncentiveDate date,foreign key (iId) references employeeData(empId));
insert into incentivesData values (1, 8000, '19-06-15'),(2, 10000, '19-05-11'),(3, 45000, '19-05-20'),(1, 9500, '19-06-20'),(2, 3500, '19-06-11');

create table jobRoles (jId int, jobrole varchar(20), DateOJ datetime,foreign key (jId) references employeeData(empId ));
insert into jobRoles values (1, 'Manager', '2019-02-01 00:00:00'),(2,'Executive', '2019-06-01 00:00:00'),(8,'Executive', '2019-06-01 00:00:00'),(5,'Manager', '2019-06-01 00:00:00'),(4,'Asst. Manager', '2019-06-01 00:00:00'),(7, 'Executive', '2019-06-01 00:00:00'),(6,'Team Lead', '2019-06-01 00:00:00'),(3,'Team Lead', '2019-06-01 00:00:00');

#Q1. Display last name as employee_last_name.

select lastName as employee_last_name from employeeData ;
/* output: 
employee_last_name
Agarwal
Kumar
Prasad
Prasad
Rao
Sripada
Varma
Verma

*/
#Q2. Display fname and lname as employee_fullname.

select concat(firstName,' ',lastName) as employy_fullname from employeeData; 
/* output
employy_fullname
Madhuri Sripada
Haritha Verma
Vimal Rao
Amrita Prasad
Vidhi Agarwal
Nitya Prasad
Sravan Kumar
Girish Varma
*/

#Q3. Display fname, lname in upper case.

select upper(firstName) as fname ,upper(lastName) as lname from employeeData; 

/*
fname  lname
MADHURI	SRIPADA
HARITHA	VERMA
VIMAL	RAO
AMRITA	PRASAD
VIDHI	AGARWAL
NITYA	PRASAD
SRAVAN	KUMAR
GIRISH	VARMA
*/

#Q4. Display unique dept from emp table.

select distinct(department) from employeeData;
/* Output:
department

HR
Admin
Account
*/

#Q5. Display emp fname in asc order.
select firstName from employeeData order by firstName ASC; 
/*
Output:
firstName

Amrita
Girish
Haritha
Madhuri
Nitya
Sravan
Vidhi
Vimal
*/
#Q6. Print details of employees 'amrita' and 'nitya'.

select * from employeeData where firstName = 'amrita' or firstName =  'nitya';

/* output:
empId, firstName, lastName, salary, DOJ, Department

4	Amrita	Prasad	500000	2019-03-10 09:00:00	Admin
6	Nitya	Prasad	200000	2019-02-11 09:00:00	Account
*/

#Q7. Details of emps except 'girish' and 'sravan'.

select * from employeeData where firstName not in ('girish','sravan');

/* output:

empId, firstName, lastName, salary, DOJ, Department
1	Madhuri	Sripada	100000	2019-02-01 09:00:00	HR
2	Haritha	Verma	80000	2019-01-10 09:00:00	Admin
3	Vimal	Rao	300000	2019-03-10 09:00:00	HR
4	Amrita	Prasad	500000	2019-03-10 09:00:00	Admin
5	Vidhi	Agarwal	500000	2019-02-11 09:00:00	Admin
6	Nitya	Prasad	200000	2019-02-11 09:00:00	Account

*/

#Q8. Display emps from hr dept.

select * from employeeData where Department = 'HR';

/* output:

empId, firstName, lastName, salary, DOJ, Department
1	Madhuri	Sripada	100000	2019-02-01 09:00:00	HR
3	Vimal	Rao	300000	2019-03-10 09:00:00	HR
*/
					
#Q9. Details of emps whose name starts with 'A'.

select * from employeeData where firstName like 'A%';
/*
output:
empId, firstName, lastName, salary, DOJ, Department
4	Amrita	Prasad	500000	2019-03-10 09:00:00	Admin
*/

#Q10. Details of emps whose name contains 'A'.

select * from employeeData where firstName like '%A%';

/*
output:

empId, firstName, lastName, salary, DOJ, Department
1	Madhuri	Sripada	100000	2019-02-01 09:00:00	HR
2	Haritha	Verma	80000	2019-01-10 09:00:00	Admin
3	Vimal	Rao	300000	2019-03-10 09:00:00	HR
4	Amrita	Prasad	500000	2019-03-10 09:00:00	Admin
6	Nitya	Prasad	200000	2019-02-11 09:00:00	Account
7	Sravan	Kumar	75000	2019-04-20 09:00:00	Account
*/

#Q11. emp details of salaries who are earning between 2.5 - 5lacs.

select empId,firstName,lastName,salary from employeeData where salary between 250000 and 500000;
/*
output:
empId, firstName, lastName, salary
3	Vimal	Rao	300000
4	Amrita	Prasad	500000
5	Vidhi	Agarwal	500000
*/


#Q12. Write a query to display employee fullname who are earning above 70,000 and below 2 lacs.

select concat(firstName,lastName) as fullname,salary from employeeData where salary > 70000 and salary < 200000;
/*
output:
fullname, salary
MadhuriSripada	100000
HarithaVerma	80000
SravanKumar	75000
GirishVarma	90000
*/

#Q13. Write a query to display dept name and number of employees in dept.

select department,count(empId) as Total_emp_In_dept from employeeData group by department;

/*
output:
department, Total_emp_In_dept
HR	2
Admin	4
Account	2
*/

#Q14. display employees who are managers.
select e.empId, e.firstName from employeeData e, jobRoles j where e.empId = j.jId and j.jobrole ='Manager';
/*
output:

empId, firstName
1	Madhuri
5	Vidhi
*/
#Q15. Print details of employees who got incentives.

select e.empId, e.firstName, sum(i.incentive) from employeeData e, incentivesData i where e.empId = i.iId group by e.empId,e.firstName;
/*
output:

empId, firstName, sum(i.incentive)

1	Madhuri	17500
2	Haritha	13500
3	Vimal	45000
*/

#Q16. Display max salary from each dept (department wise max salary).

select firstName,department,max(salary) from employeeData group by department;
/*
output:

firstName, department, max(salary)
Madhuri	HR	300000
Haritha	Admin	500000
Nitya	Account	200000

*/

#Q17. Print emp name, dept name and bonus amount who got highest bonus.

select e.firstName, e.department,sum(i.incentive) from employeeData e, incentivesData i where e.empId = i.iId group by e.firstName order by sum(i.incentive) DESC LIMIT 1;

/*
output:
firstName, department, sum(i.incentive)
Vimal	HR	45000
Madhuri	HR	17500
Haritha	Admin	13500
*/

#Q18. Display details of emp who is earing max salary.

SELECT e.empId, e.lastName, e.firstName, e.salary, e.department, e.DOJ FROM employeeData e
JOIN (SELECT MAX(Salary) As Highest, department FROM employeeData GROUP BY department) b
ON e.department = b.department && e.Salary = b.Highest;

/*
output:
empId, firstName, lastName, salary, DOJ, Department
3	Rao	Vimal	300000	HR	2019-03-10 09:00:00
4	Prasad	Amrita	500000	Admin	2019-03-10 09:00:00
5	Agarwal	Vidhi	500000	Admin	2019-02-11 09:00:00
6	Prasad	Nitya	200000	Account	2019-02-11 09:00:00

*/

#Q19. Print emp last name , dept , salary of employees who is earing max salary in each department.

SELECT e.lastName, e.department, e.salary FROM employeeData e
JOIN (SELECT MAX(Salary) As Highest, department FROM employeeData GROUP BY department) b
ON e.department = b.department && e.Salary = b.Highest;

/*
output:
lastName, department, salary
Rao	HR	300000
Prasad	Admin	500000
Agarwal	Admin	500000
Prasad	Account	200000

*/

#Q20. Print emp details who is earning lowest salary.

select * from employeeData where salary = (select min(salary) from employeeData);
/*
output:

empId, firstName, lastName, salary, DOJ, Department
7	Kumar	Sravan	75000	Account	2019-04-20 09:00:00

*/
#Q21. Print the emp last name, job role and effective date for each employee.

select e.lastName, j.jobRole, j.dateOJ from employeeData e join jobRoles j where e.empId = j.jId;
/* output:

lastName, jobRole, dateOJ
Sripada	Manager	2019-02-01 00:00:00
Verma	Executive	2019-06-01 00:00:00
Rao	Team Lead	2019-06-01 00:00:00
Prasad	Asst. Manager	2019-06-01 00:00:00
Agarwal	Manager	2019-06-01 00:00:00
Prasad	Team Lead	2019-06-01 00:00:00
Kumar	Executive	2019-06-01 00:00:00
Varma	Executive	2019-06-01 00:00:00
*/

#Q22. Print emp lastname.
select lastName from employeeData;

/* 
output:

lastName

Sripada
Verma
Rao
Prasad
Agarwal
Prasad
Kumar
Varma
*/

