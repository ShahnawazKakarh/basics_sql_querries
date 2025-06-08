/* Create Employee Table */
Create table employee(
EmpID INT,
Emp_Name NVARCHAR(30),
Age INT,
EmailID NVARCHAR(30),
PhoneNo NVARCHAR(30),
City NVARCHAR(30)
);

/* fetch all employees records from db */
SELECT * FROM employee;

/* Enter Data in Employee Table*/
INSERT INTO employee(EmpID,Emp_Name,Age,EmailID,PhoneNo,City)VALUES(1,'Aadil',24,'Aadil@gmail.com','0313-3226755','Karachi');
INSERT INTO employee(EmpID,Emp_Name,Age,EmailID,PhoneNo,City)VALUES(2,'Asad',25,'Asad@gmail.com','0212-3556755','Lahore');
INSERT INTO employee(EmpID,Emp_Name,Age,EmailID,PhoneNo,City)VALUES(3,'Ahmed',24,'AhmedAli@gmail.com','0341-3226788','Karachi');
INSERT INTO employee(EmpID,Emp_Name,Age,EmailID,PhoneNo,City)VALUES(4,'Shahryar',25,'Shahryar@gmail.com','0321-426755','Lahore');
INSERT INTO employee(EmpID,Emp_Name,Age,EmailID,PhoneNo,City)VALUES(5,'Areeb',24,'AreebAhmedKhan@gmail.com','0212-5526755','Karachi');
INSERT INTO employee(EmpID,Emp_Name,Age,EmailID,PhoneNo,City)VALUES(6,'Khushdil',28,'Khushdil@gmail.com','0215-9026755','Lahore');
INSERT INTO employee(EmpID,Emp_Name,Age,EmailID,PhoneNo,City)VALUES(7,'Jaffer',28,'Jaffer@gmail.com','0215-23455644','Peshawar');

/* create table project */
Create table Project(
Emp_Name NVARCHAR(30),
Emp_id INT,
ProjectName NVARCHAR(30),
Contact INT
);

/* fetch all project records from db */
SELECT * FROM project;

/* inserting data in project table */
INSERT INTO Project(Emp_Name,Emp_ID,ProjectName,Contact)
VALUES('Aarish',1,'Project1',45),
('Akbar',2,'Project2',454),
('Ashar',3,'Project3',66),
('Aadil',4,'Project4',53),
('Asad',5,'Project5',665),
('Ahmed',6,'Project6',22),
('Akbar',7,'Project2',42);


/* Update Table Values*/
UPDATE Project
SET Emp_Name = 'Smith', ProjectName= 'Project23'
WHERE Emp_id = 1;


/* Again Rename Table Values*/
UPDATE Project
SET Emp_Name = 'Mujahid', ProjectName= 'Project1'
WHERE Emp_id = 1;


/* Select Specific values from table*/
Select Emp_id, Contact from dbtest.project;


/* Select distinct from Table*/
Select  distinct(Contact) from dbtest.project;


/* Count values*/
select count(Contact) as CountofContact  from dbtest.project;

/* Count distinct values*/
select count(distinct Contact) as  CountofContact  from dbtest.project;


/* Use Where*/
Select * from dbtest.employee where Emp_Name = 'Areeb';
Select EmailID,PhoneNo,City from dbtest.employee where PhoneNo = '0212-5526755';


/* Use AND*/
Select EmailID, PhoneNo, City from dbtest.employee where PhoneNo = '0215-9026755' AND City ='Lahore' AND EmpID = 6 ;


/* Use OR*/
Select EmailID, PhoneNo, City from dbtest.employee where PhoneNo = '0215-9026755' OR  City ='Peshawar';
Select EmailID, PhoneNo, City from dbtest.employee where PhoneNo = '0215-9026755' OR NOT City ='Peshawar';

/* Use NOT*/
Select EmailID, PhoneNo, City from dbtest.employee where NOT PhoneNo = '0313-3226755' AND NOT City ='Lahore';

/* Use OrderBy*/
select * from dbtest.employee WHERE EmpID = 6 OR EmpID = 2  order by Age;  /* ASC*/ 
select * from dbtest.employee order by Age DESC; /* DESC*/

/* Use GroupBy*/
select Count(City) as City_Count,Count(PhoneNo) as Total_Numbers, Age from  dbtest.employee group by Age; 


/* Use Having*/
select Count(City) as City_Count,Count(PhoneNo) as Total_Numbers, City from dbtest.employee group by City having City_Count >= 1; 

/* Use Null*/
INSERT INTO employee(EmpID,Emp_Name,Age,EmailID,PhoneNo,City)VALUES(7,'Jaffer',28,'Jaffer@gmail.com',NULL,NULL);
select * from dbtest.employee where PhoneNo is null;

/* Use NOT Null*/
select * from dbtest.employee where City is not null;

/* Delete Value*/
delete from dbtest.employee where EmpID = 1 OR EmpID = 2 ;

/* Use Like*/
select * from dbtest.employee where City Like 'k%';
select * from dbtest.employee where City Like 'Lah%';
select * from dbtest.employee where City Like '%chi';
select * from dbtest.employee where City Like '%ara%';
select * from dbtest.employee where City Like '%_r_%';

/* Use Avg,Sum,Min and Max*/
Select Avg(Age) from dbtest.employee;
Select Max(Age) from  dbtest.employee;
Select Min(Age) from  dbtest.employee;
Select Sum(Age) as sum from  dbtest.employee;

/* Use Between*/
Select * from dbtest.employee where age between 23 and 28;

/* Use Limit*/
Select * from dbtest.employee where age between 23 and 28 Limit 3;
INSERT INTO employee(EmpID,Emp_Name,Age,EmailID,PhoneNo,City)VALUES(8,'Waleed',28,'Waleed@gmail.com','0231-22343','Peshawar');

/* Use Join*/
Select * from employee_data.employee e join employee_data.project p
on e.EmpID = p.Emp_id; 

/* Use Left Join*/
Select * from employee_data.employee e Left join employee_data.project p
on e.EmpID = p.Emp_id;

/* Use Right Join*/
Select * from employee_data.employee e Right join employee_data.project p
on e.EmpID = p.Emp_id;

/* Use drop Table*/
drop table employee_data.employee;
drop table employee_data.project;
