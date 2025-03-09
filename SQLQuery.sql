-- SQL
-- DDL
--- >> Create - Drop - Alter - Truncate
Create Database DEPI2
USE DEPI2
Create table Dep (
Dept_id int primary key, dept_name varchar(20)
)

Create table Student (
st_id int Primary key,
st_name varchar(20) ,
st_age int check (st_age >=18),
st_address varchar(50) Default 'Tanta',
D_id int Foreign key References Dep (Dept_id)
)

Drop table Dep
Drop database DEPI2

Truncate table Dep
-- Alter >>> Add - Drop column - alter column
Alter table Student Add st_email varchar(30) Not Null
Alter table Student Drop Column st_email
Alter table Student Alter column St_name varchar(50)
-- DML
--- >> Insert - Delete - Update
Insert into Dep (Dept_id , Dept_name)
Values (1, 'IT'), (2,'AI'), (3, 'CQ')
Select * From Dep

Update Dep
Set Dept_name = 'ML'
Where dept_id = 3

Delete From Dep
Where Dept_id = 3

Delete From Employee
-- DQL
--- >> SELECT
USE ITI

SELECT *
From Student

Select *
From Student 
where St_Address = 'Cairo' and St_age >=24

Select St_fname +' '+ St_lname 'Full_Name'
From Student
where St_Fname IS NOT NULL and st_lname IS NOT NULL

-- Retreive all students where address start with 'A'
-- and dept_id is 10 or 20
----- % >> zero or more characters 
--      >> one character
-- Comparison Operators >> TRUE - FALSE
-- > < >= <= = <>

Select * 
From Student
Where St_Address Like 'A%' and
(Dept_id = 10 or Dept_id = 20 or Dept_Id = 30)

Select * 
From Student
Where St_Address Like 'A%' and Dept_Id in (10,20,30)
and St_Age >=24

SELECT  * , Columns names >> Alias name , +,
-- Functions Function name()
--- >>1- Aggregate Functions 
-- Sum , AVG, MAX , MIN , Count
--- >>2- String Functions
-- Upper - Lower - Concat/+ - Left - Right - Substring - Trim

-- Count(Column name) without nulls + duplicates
-- Count(*) >> with null + duplicates
-- Count( Distinct Column name) >> without null + unique values
Select Count(Distinct Dept_Id)
From Student
FROM
WHERE


Select Distinct Dept_id From Student
Where Dept_id IS NOT NULL

Select * From Instructor

USE Rollup_Cube
Select * From Test

Select Sum(Salary) Total_Salary,
Round(Avg(Salary),2)  Avg_salary,
Max(salary) Max_salary,
Min(Salary) Min_Salary,
Count(*) '#Orders'
From Test

-- Total Salary by Department
Select Department , Gender,Sum(Salary) Total
From test
Group by department, Gender
Order by department

-- Rollup - Cube
-- 1- #Orders by Gender
Select Department, Gender , Sum(salary) 'salary'
From Test
Group by Cube(Department,Gender)

Select COALESCE(Department,'GrandTotal'), Sum(salary) 'salary'
From Test
Group by Rollup(Department)


-- 2- Avg. Salary by Dep
-- 3- Total Salary, MAx salary by Department
-- 4- #orders by Department and Gender

USE BikeStores
Select oi.*, Product_name 
From Sales.Order_items oi inner join production.products p
on P.product_id = oi.product_id
