USE school_db;
-- 1) Show names of students who scored more than 80. (WHERE Clause) 
SELECT name FROM students WHERE marks>80;

-- 2) Display students from Delhi sorted by marks in descending order. (WHERE + ORDER BY) 
SELECT * FROM students WHERE city="Delhi"
ORDER BY marks;

-- 3) Count how many students are from Mumbai. (COUNT + WHERE) 
SELECT COUNT(*) AS total_mumbai_students
FROM students 
WHERE city="Mumbai";

-- 4) Find the minimum marks in the table. (Aggregate Function - MIN) 
SELECT MIN(marks) AS MINIMUM_MARKS FROM students;

-- 5) Show name and marks of the youngest student. (Subquery - MIN) 
SELECT name, age
FROM students
WHERE age = (SELECT MIN(age) FROM students);

-- 6) Find the average marks of all students. (Aggregate Function - AVG) 
SELECT AVG(marks) AS average_marks
FROM students;

-- 7) Show city-wise total number of students. (GROUP BY + COUNT) 
SELECT city, COUNT(*) AS total_students
FROM students
GROUP BY city;

-- 8) Find cities having more than 2 students. (GROUP BY + HAVING) 
SELECT city
FROM students
GROUP BY city
HAVING COUNT(*) > 2;

-- 9) Show students whose marks are above overall average. (Subquery) 
SELECT name, marks
FROM students
WHERE marks > (SELECT AVG(marks) FROM students);

-- 10) Display grade using CASE: 
-- 90+ → Outstanding 
-- 80–89 → Excellent 
-- 70–79 → Good 
-- Below 70 → Average 
-- (CASE Statement) 
SELECT name, marks,
CASE
    WHEN marks >= 90 THEN 'Outstanding'
    WHEN marks >= 80 THEN 'Excellent'
    WHEN marks >= 70 THEN 'Good'
    ELSE 'Average'
END AS grade
FROM students;

-- 11) Find students who scored above their city average. (Correlated Subquery) 
SELECT name, city, marks
FROM students s1
WHERE marks > (
    SELECT AVG(marks)
    FROM students s2
    WHERE s2.city = s1.city
);

-- 12) Count number of students passed (marks ≥ 75) using CASE and SUM. (Conditional 
-- Aggregation - CASE + SUM) 
SELECT
SUM(
    CASE
        WHEN marks >= 75 THEN 1
        ELSE 0
    END
) AS total_passed
FROM students;

-- 13) Create a CTE to calculate city-wise average marks and display it. (CTE + GROUP BY) 
WITH city_avg AS (
    SELECT city, AVG(marks) AS avg_marks
    FROM students
    GROUP BY city
)
SELECT * FROM city_avg;

-- 14) Delete students who scored below 65. (DELETE Statement) 
DELETE FROM studentS
WHERE marks<65;

-- 15) Find the second highest marks in the table without using LIMIT OFFSET. (Subquery - 
-- MAX with condition) 
SELECT MAX(marks) AS second_highest
FROM students
WHERE marks < (SELECT MAX(marks) FROM students);