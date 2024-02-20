-- студентов, выступивших на всех конференциях;
USE conference_db_lab1;

SELECT s.id   AS student_id,
       s.name AS student_name
    FROM student s
             JOIN authorship a ON s.id = a.author_id
             JOIN topic t ON a.topic_id = t.id
             JOIN conference_session cs ON t.session_id = cs.id
    GROUP BY s.id, s.name
    HAVING COUNT(DISTINCT cs.conference_id) = (SELECT COUNT(DISTINCT id) FROM conference);