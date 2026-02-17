CREATE DATABASE school_db;
USE school_db;

CREATE TABLE students(
id INT,
name VARCHAR(50),
age INT,
marks INT,
city VARCHAR(50)
);

INSERT INTO students(id,name,age,marks,city) VAlUES
(1,"Rahul",20,85,"Delhi"),
(2,"Anita",22,90,"Mumbai"),
(3,"Vikram",19,70,"Delhi"),
(4,"Priya",21,88,"Chennai"),
(5,"Aman",23,60,"Mumbai"),
(6,"NEha",20,95,"Delhi"),
(7,"Karan",22,75,"Kolkata"),
(8,"Sneha",19,82,"Chennai");

SELECT * FROM students;

SELECT name,marks FROM students;

SELECT * FROM students 
WHERE city="Delhi";

SELECT * FROM students
WHERE age>20;

SELECT * FROM students WHERE age=19 or age=20;

SELECT COUNT(*) from students;

SELECT MAX(marks) FROM students;
SELECT MIN(marks) FROM students;
SELECT AVG(marks) FROM students;

SELECT * FROM students
ORDER BY city;

SELECT * FROM students
ORDER BY marks DESC
LIMIT 4;

SELECT * FROM students
WHERE name LIKE 'A%';

SELECT * FROM students 
WHERE name like '%a';

SELECT DISTINCT city FROM students;

SELECT * FROM students 
ORDER BY city,marks DESC;

SELECT SUM(marks) from students;

SELECT city,AVG(marks)
FROM students GROUP BY city;

SELECT city ,AVG(marks)
FROM students 
GROUP BY city
HAVING AVG(marks)>80;

SELECT * FROM students
WHERE city="Delhi"
AND marks>80
AND age>20;

CREATE TABLE courses(
student_id INT,
course_name VARCHAR(50)
);

INSERT INTO courses VALUES
(1,'Data Science'),
(2,'SQL'),
(3,"Python"),
(4,"Data Analysis");


SELECT students.name , courses.course_name
FROM students
INNER JOIN courses
ON students.id=courses.student_id;

SELECT students.name , courses.course_name
FROM students 
LEFT JOIN courses
ON students.id=courses.student_id;

SELECT students.name , courses.course_name
FROM students 
RIGHT JOIN courses
ON students.id=courses.student_id;

SELECT city,AVG(marks) as avg_marks
FROM students
GROUP BY city
ORDER By avg_marks DESC
LIMIT 1;

SELECT * FROM students
where city != "Mumbai";

SELECT * FROM students 
WHERE marks>(SELECT AVG(marks) FROM students );

SELECT COUNT(DISTINCT students.id) as total_students 
FROM students 
INNER JOIN courses
ON students.id=courses.student_id;


SELECT courses.course_name , MAX(students.marks) AS highest_marks
FROM students 
JOIN courses 
ON students.id=courses.student_id
GROUP BY courses.course_name;

SELECT city,course_name,count(*) as total_students
FROM students
JOIN courses
ON students.id = courses.student_id
GROUP BY city , course_name;

SELECT courses.course_name , count(student_id) as total_students
FROM students
JOIN courses
ON students.id = courses.student_id
group by courses.course_name
ORDER BY total_students DESC
LIMIT 1;

select courses.course_name , MIN(marks) as lowest_marks
from students
join courses
on students.id = courses.student_id
GROUP BY courses.course_name;

Select students.name , courses.course_name
from students
join courses
on students.id = courses.student_id
WHERE students.marks>80;

Show tables;

SELECT name , marks
from students 
WHERE marks > (SELECT avg(marks) FROM students);

SELECT name , marks
from students
WHERE marks = (SELECT MAX(marks) FROM students);

SELECT name
from students 
WHERE city=(SELECT city FROM students WHERE name="Rahul");

SELECT name , marks
FROM students 
WHERE marks<(
SELECT MIN(marks)
FROM students
WHERE city="Delhi");

SELECT name ,city,marks
FROM students s1
WHERE marks>(
SELECT AVG(marks)
FROM students s2
WHERE s2.city=s1.city);

SELECT s.name , s.city , s.marks
FROM students s
JOIN (
SELECT city , avg(marks) as avg_marks
from students
group by city)
city_avg ON s.city=city_avg.city
WHERE s.marks>city_avg.avg_marks;

SELECT name , city , marks
FROM students s1
WHERE marks = (SELECT
 MAX(marks)
 from students s2
 WHERE s2.city=s1.city);
 
 SELECT name ,
 CASE
 WHEN marks>=90 THEN "OUTSTANDING"
 WHEN marks>=80 THEN "EXCELLENT"
 WHEN marks>=70 THEN "GOOD"
 ELSE "AVERAGE"
 END AS grade 
 FROM students;
 
 SELECT name ,
 case 
 WHEN marks>=80 THEN "PASS"
 ELSE "FAIL"
 END AS result
 FROM students;
 
 SELECT name, 
 CASE 
 WHEN marks>=90 THEN marks+5
 ELSE marks
 END AS updated_marks
 FROM students;
 
 







WITH avg_cte AS (
    SELECT AVG(marks) AS avg_marks
    FROM students
)
SELECT name, marks
FROM students, avg_cte
WHERE marks > avg_marks;

WITH city_avg as (
SELECT city , avg(marks) as avg_marks 
FROM students 
group by city
)
SELECT * from city_avg;

-- DELETE FROM students
-- WHERE city="Delhi";

-- TRUNCATE TABLE students;

-- DROP TABLE students; 

SELECT name , age
FROM students
WHERE age>(SELECT MIN(age) FROM students);

SELECT name , city 
FROM students s1
where 1 = (
select count(*)
FROM students s2 
where s2.city = s1.city);

WITH city_count as (SELECT city , count(*) as total_students
FROM students 
GROUP BY city)
SELECT * from city_count;

SELECT name , age ,
CASE
WHEN age<=20 THEN "YOUNG"
WHEN age BETWEEN 21 AND 22 THEN "ADULT"
ELSE "SENIOR"
END AS age_group
from students;

SELECT SUM(
CASE
WHEN marks >=75 THEN 1
ELSE 0
END )
AS total_passed from students;
 
