/* 												SQL ASSIGNMENT - 1										*/
#create database datafolkz;

use datafolkz;

create table customers (custId int primary key not null,custName varchar(10), city varchar(10) );
Insert into customers values (1,"Rupa", "Hyderabad"),(2, "Sudha", "Hyderabad"),(3, "Vinay", "Chennai"),(4, "Sruthi", "Vijayawada"),(5, "Madhu", "Chennai"),(6, "Gita", "Hyderabad");

create table orders (oid int primary key not null, cId int ,odate date, foreign key (cId) references customers(custId ));
Insert into orders values (22,3,'2018-07-15'),(23,1,'2018-07-16'),(24,1,'2018-07-17'),(25,2,'2018-07-19'),(26,4,'2018-07-20'),(27,5,'2018-07-20'),(28,5,'2018-07-12');

# Q-1. Select all the customers who have placed orders.

select distinct(c.custId),c.custName from customers c ,orders o where c.custId = o.cId;
# OR
select distinct(c.custId), c.custName, c.city from customers c inner join orders o on c.custID = o.cId;
/* o/p:

1	Rupa	Hyderabad
2	Sudha	Hyderabad
3	Vinay	Chennai
4	Sruthi	Vijayawada
5	Madhu	Chennai

*/

# Q-2. Display num of orders placed by each customer.

select c.custId,c.custName,count(c.custId) from customers c ,orders o where c.custId = o.cId group by c.custId,c.custName;

/* 
o/p: 

1	Rupa	2
2	Sudha	1
3	Vinay	1
4	Sruthi	1
5	Madhu	2

*/

# Q-3. Select all the customers who have placed more than 1 order

select c.custId,c.custName,count(c.custId) from customers c ,orders o where c.custId = o.cId  group by c.custId,c.custName having count(c.custId) > 1;

/*
o/p:

1	Rupa	2
5	Madhu	2

*/

# Q-4. Select all the customers who did not place any order

SELECT custId,custName,city FROM customers WHERE custId NOT IN (SELECT cId FROM orders);

/*
o/p:
	6	Gita	Hyderabad
*/

# Q-5. Display customer names who have made a purchase on July 20th

SELECT c.custName, o.odate FROM customers c, orders o WHERE c.custId = o.cId and DATE_FORMAT(o.odate, '%M %D') = 'July 20th';

/*
o/p:
Sruthi	2018-07-20
Madhu	2018-07-20
*/

# Q-6. Select all the customers who made purchases after July 12th and before July 18th
SELECT c.custName, o.odate FROM customers c, orders o WHERE c.custId = o.cId and DATE_FORMAT(o.odate, '%M %D') > 'July 12th' and DATE_FORMAT(o.odate, '%M %D') < 'July 18th';
#	OR

SELECT c.custName, o.odate FROM customers c, orders o WHERE c.custId = o.cId and DATE_FORMAT(o.odate, '%M %D') > 'July 12th' and DATE_FORMAT(o.odate, '%M %D') < 'July 18th' group by c.custName;
/*
o/p:

Rupa	2018-07-16
Rupa	2018-07-17
Vinay	2018-07-15

OR we can fetch like below as well

Rupa	2018-07-16
Vinay	2018-07-15

*/

# Q-7. Select all the customer who did not purchase on these days - 12th and 18th .

SELECT c.custName, o.odate FROM customers c, orders o WHERE c.custId = o.cId and DATE_FORMAT(o.odate, '%M %D') !=  'July 12th' and DATE_FORMAT(o.odate, '%M %D') != 'July 18th' group by c.custName;

#	OR

SELECT c.custName, o.odate FROM customers c, orders o WHERE c.custId = o.cId and DATE_FORMAT(o.odate, '%M %D') !=  'July 12th' and DATE_FORMAT(o.odate, '%M %D') != 'July 18th';
/*
o/p:

Rupa	2018-07-16
Rupa	2018-07-17
Sudha	2018-07-19
Vinay	2018-07-15
Sruthi	2018-07-20
Madhu	2018-07-20

OR we can fetch by below as well

Rupa	2018-07-16
Sudha	2018-07-19
Vinay	2018-07-15
Sruthi	2018-07-20
Madhu	2018-07-20

*/


