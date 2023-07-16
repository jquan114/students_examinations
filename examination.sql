-- Table: Students

-- +---------------+---------+
-- | Column Name   | Type    |
-- +---------------+---------+
-- | student_id    | int     |
-- | student_name  | varchar |
-- +---------------+---------+
-- In SQL, student_id is the primary key for this table.
-- Each row of this table contains the ID and the name of one student in the school.
 

-- Table: Subjects

-- +--------------+---------+
-- | Column Name  | Type    |
-- +--------------+---------+
-- | subject_name | varchar |
-- +--------------+---------+
-- In SQL, subject_name is the primary key for this table.
-- Each row of this table contains the name of one subject in the school.
 

-- Table: Examinations

-- +--------------+---------+
-- | Column Name  | Type    |
-- +--------------+---------+
-- | student_id   | int     |
-- | subject_name | varchar |
-- +--------------+---------+
-- This table may contain duplicates (In other words, there is no primary key for this table in SQL).
-- Each student from the Students table takes every course from the Subjects table.
-- Each row of this table indicates that a student with ID student_id attended the exam of subject_name.
 

-- Find the number of times each student attended each exam.

-- Return the result table ordered by student_id and subject_name.

-- # Write your MySQL query statement below

SELECT s.student_id, s.student_name, sub.subject_name, COUNT(e.subject_name) AS attended_exams
FROM Students s
CROSS JOIN Subjects sub
LEFT JOIN Examinations e ON s.student_id = e.student_id AND sub.subject_name = e.subject_name
GROUP BY s.student_id, s.student_name, sub.subject_name
ORDER BY s.student_id, sub.subject_name;
