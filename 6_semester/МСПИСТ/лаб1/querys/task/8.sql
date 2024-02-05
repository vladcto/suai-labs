-- студентов, выступивших на всех конференциях;
USE conference_db_lab1;

SELECT s.id   AS student_id,
       s.name AS student_name
    FROM student s
             JOIN
             topic t ON s.id = t.author_id
    GROUP BY s.id, s.name
    HAVING COUNT(DISTINCT t.conference_id) = (SELECT COUNT(DISTINCT id) FROM conference);
