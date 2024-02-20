-- студентов, выступивших на всех конференциях;
USE conference_db_lab1;

SELECT s.id   AS student_id,
       s.name AS student_name
    FROM student s
    WHERE EXISTS(SELECT 1
                     FROM student s
                     WHERE NOT EXISTS(SELECT conference.id
                                          FROM conference
                                                   JOIN conference_db_lab1.conference_session cs
                                                        ON conference.id = cs.conference_id
                                                   JOIN conference_db_lab1.topic t ON cs.id = t.session_id
                                                   JOIN conference_db_lab1.authorship a ON t.id = a.topic_id
                                                   JOIN conference_db_lab1.student s2 ON s2.id = a.author_id
                                          WHERE ))