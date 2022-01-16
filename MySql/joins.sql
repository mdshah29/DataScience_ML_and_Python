use datafolkz;

CREATE TABLE members( member_id int ,  name VARCHAR(100));
CREATE TABLE commitee( commite_id int ,  name VARCHAR(100));                                                    
                                                     
iNSERT INTO members(member_id,name) VALUES(1,'John'),(2,'Jane'),(3,'Mary'),(4,'David'),(5,'Amelia');   
iNSERT INTO commitee(commite_id,name) VALUES(1,'John'),(2,'Jane'),(3,'Amelia'),(4,'joe'); 

select * from members;
select * from commitee;

SELECT m.member_id, m.name as member, c.commite_id, c.name as commitee FROM members m 
INNER JOIN commitee c ON c.name = m.name;

SELECT m.member_id, m.name as member, c.name as commitee FROM members m INNER JOIN commitee c ON c.name = m.name;

SELECT m.member_id, m.name as member, c.name as commitee
FROM members m
FULL OUTER JOIN commitee c
ON c.name = m.name;

SELECT 
	m.member_id, 
    m.name as member,
    c.name as commitee
FROM
	members m
OUTER JOIN
	commitee c 
ON 
	c.name = m.name;

SELECT 
    m.member_id, 
    m.name as member, 
    c.commite_id, 
    c.name as commitee
FROM
    members m
LEFT JOIN commitee c on c.name=m.name;







# Create a table called students (student_no,student_name,class,marks    -- 7 records 
# create a table reports (student_no, student_name,class,marks,report)  -- 4 record

CREATE TABLE students( stuno int, stuname varchar(20), class int, marks int);
CREATE TABLE report( stuno int, stuname varchar(20), class int, marks int,report varchar(10));    

iNSERT INTO students VALUES(1,'John',12,80),(2,'Jane',10,70),(3,'Mary',11,90),(4,'David',16,86),(5,'Amelia',9,90);   
iNSERT INTO report VALUES(1,'John',2,80,'a'),(2,'Jane',10,70,'b'),(3,'Amelia',8,100,'a+'),(4,'joe',12,80,'a'); 

# Inner Join

SELECT m.stuname, m.stuno , c.stuno, c.stuname FROM students m 
INNER JOIN report c ON c.stuname = m.stuname;

# Left JOIN
SELECT 
    *
FROM
    students m
LEFT JOIN report c on c.stuname = m.stuname;

# Right Join

SELECT 
    *
FROM
    students m
RIGHT JOIN report c on c.stuname = m.stuname;


                                                


SELECT DATE_FORMAT(CURDATE(), '%m/%d/%Y') today;
select datediff("2018-05-01","2018-03-01");
select(now());
select(day(curdate()));   
select(dayname(curdate()));
