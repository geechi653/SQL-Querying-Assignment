-- 1
SELECT first_name, last_name FROM student;

-- 2 
SELECT instructor_id FROM instructor WHERE tenured = 1;

-- 3 
SELECT s.first_name AS student_first_name, s.last_name AS student_last_name,
       a.first_name AS advisor_first_name, a.last_name AS advisor_last_name
FROM student s
INNER JOIN instructor a ON s.advisor_id = a.instructor_id
WHERE s.advisor_id IS NOT NULL;

-- 4
SELECT instructor_id, first_name, last_name
FROM instructor
WHERE instructor_id NOT IN (SELECT DISTINCT advisor_id FROM student WHERE advisor_id IS NOT NULL);


-- 5
SELECT i.first_name, i.last_name, SUM(c.num_credits) AS total_credits
FROM instructor i
INNER JOIN course c ON i.instructor_id = c.instructor_id
GROUP BY i.instructor_id;

 -- 6 
 SELECT course_code, course_name
FROM course
WHERE course_code LIKE '___3%';


-- 7 
SELECT c.course_code, i.first_name AS instructor_first_name, i.last_name AS instructor_last_name, c.num_credits
FROM student_schedule ss
INNER JOIN student s ON ss.student_id = s.student_id
INNER JOIN course c ON ss.course_id = c.course_id
INNER JOIN instructor i ON c.instructor_id = i.instructor_id
WHERE s.student_id = 1;

