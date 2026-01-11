create database job;
use job;
select*from job_placement;
alter table job_placement rename to job;
#1.What is the maximum age of candidates in the job placement database?
select max(age)maximunm_age from job;
#2.How many unique educational streams are represented in the job placement records?
select COUNT(DISTINCT Stream) AS unique_Educational_Streams FROM Job;
#3.How many candidates have exactly 3 years of experience?
select count(*) years_of_experience from job where years_of_experience=3;
#4.What are the details of job placements for Computer Science students, sorted by highest to lowest salary?
select * from job where stream='computer science' order by salary desc;
#5.What are the details of candidates who got placed, sorted by highest to lowest salary?
select * from job where placement_status='placed' order by salary desc;
#6.How many candidates have been successfully placed?
select count(*) from job where  placement_status='placed';
#7.What are the job placement details sorted by the least to most years of experience?
select * from job order by years_of_experience asc;
#8.What are the job placement details sorted first by highest to lowest years of experience and then by highest to lowest salary?
select *from job order by years_of_experience DESC, salary DESC;
#9.What are the job placement details sorted alphabetically by college name?
select *FROM job order by  college_name ASC;
#10.What are the details (age, stream, years of experience, salary) of candidates whose years of experience are greater than 
#the minimum experience in the dataset and have a salary of 60,000?
select age, stream, years_of_experience, salary from job where  years_of_experience > 
(SELECT MIN( years_of_experience) FROM job) AND salary = 60000;
#11.What are the names, ages, streams, and years of experience of placed candidates who belong to the Computer Science stream?
SELECT name, age,stream, years_of_experience FROM job WHERE placement_status = 'Placed' AND stream = 'Computer Science';
#12.What are the names, ages, and streams of candidates older than 25 who have not been placed?
select name, age, stream from job where age > 25 and placement_status <> 'Placed';
#13.What are all the details of job placements?
select*from job;
#14.What are the names, ages, and salaries of female candidates earning more than 50,000?
select name,age,salary from job where salary> 50000 and gender='female';
#15.What are the names, ages, streams, and salaries of candidates, along with their salary range categorized as 'Low Salary' 
#(below 25,000), 'Medium Salary' (25,000 to 50,000), and 'High Salary' (above 50,000)?
select name, age, stream, salary, CASE WHEN salary < 25000 THEN 'Low Salary' WHEN salary BETWEEN 25000 AND 50000 THEN 'Medium Salary'
ELSE 'High Salary'END AS salary_range FROM job;
#16.What are the names, genders, streams, ages, and years of experience of candidates, along with their job position categorized as
 #'Fresher' (≤1 year), 'Junior' (<2 years), and 'Senior' (≥2 years)?
SELECT name, gender, stream, age, years_of_experience,CASE WHEN years_of_experience <= 1 THEN 'Fresher' WHEN years_of_experience 
< 2 THEN 'Junior'ELSE 'Senior' END AS job_position FROM job;
#17.What is the average salary for each educational stream?
select stream, AVG(salary)from job group by  stream;
#18.How many candidates belong to each educational stream?
select  stream, count(*)  from job group by stream;
#19.How many candidates have been placed in each educational stream?
SELECT stream, COUNT(*) FROM job WHERE placement_status = 'Placed' GROUP BY stream;
#20.How many candidates have different years of experience?
select count(distinct years_of_experience)from job;
#21.How many candidates are placed and not placed?
select  placement_status, count(*)from job group by  placement_status;
#22.How many candidates are there in each gender category?
select gender,count(*) from job group by gender;
#23.What is the average years of experience for placed and not placed candidates?
select placement_status ,avg(years_of_experience)from job group by placement_status;
#24.What are the maximum and minimum years of experience for each educational stream?
select stream ,max(years_of_experience),min(years_of_experience) from job group by stream;
#25.What are the highest, lowest, and average salaries for each educational stream?
select stream ,max(salary),min(salary),avg(salary) from job group by stream;
#26.What are the salaries of candidates from the Computer Science stream?
select name,salary from job where stream="computer science";
#27.Which candidates have a salary higher than at least one candidate from the Computer Science stream?
select name, salary from job where salary > (SELECT MIN(salary) FROM job WHERE stream = 'Computer Science');
#28.Which candidates from streams other than Computer Science have a salary higher than at least one candidate from the 
#Computer Science stream?
SELECT name, stream, salary FROM job WHERE stream <> 'Computer Science'  AND salary > (SELECT MIN(salary) 
FROM job WHERE stream = 'Computer Science');
#29.Which candidates from streams other than Information Technology have more years of experience than at least one candidate 
#from the Information Technology stream?
SELECT name, stream, years_of_experience FROM job WHERE stream <> 'Information Technology' AND years_of_experience > (SELECT MIN( years_of_experience)
FROM job WHERE stream = 'Information Technology');
#30.What is the average years of experience for placed and not placed candidates?
select placement_status, avg( years_of_experience)from job group by placement_status;




