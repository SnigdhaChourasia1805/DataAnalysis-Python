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




