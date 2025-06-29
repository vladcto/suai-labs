-- студентов, выступивших на всех конференциях;
USE conference_db_lab1;

SELECT s.id AS student_id,
       s.name AS student_name
FROM student s
WHERE NOT EXISTS (
    SELECT 1 FROM conference c
    WHERE NOT EXISTS (
        SELECT 1 FROM authorship a
        JOIN topic t ON a.topic_id = t.id
        JOIN conference_session cs ON t.session_id = cs.id
        WHERE a.author_id = s.id AND cs.conference_id = c.id
    )
);