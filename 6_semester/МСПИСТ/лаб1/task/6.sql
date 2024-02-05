-- студентов, выступивших на трех или большем числе конференций
USE conference_db_lab1;

SELECT s.id                            AS student_id,
       s.name                          AS student_name,
       COUNT(DISTINCT t.conference_id) AS conferences_count
    FROM student s
             LEFT JOIN
             topic t ON s.id = t.author_id
    GROUP BY s.id, s.name
    HAVING conferences_count >= 3;
