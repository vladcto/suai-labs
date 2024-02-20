-- студентов, выступивших на трех или большем числе конференций
USE conference_db_lab1;

SELECT s.id                             AS student_id,
       s.name                           AS student_name,
       COUNT(DISTINCT cs.conference_id) AS conference_count
    FROM student s
             JOIN
             authorship a ON s.id = a.author_id
             JOIN
             topic t ON a.topic_id = t.id
             JOIN
             conference_session cs ON t.session_id = cs.id
    GROUP BY s.id, s.name
    HAVING conference_count >= 3;