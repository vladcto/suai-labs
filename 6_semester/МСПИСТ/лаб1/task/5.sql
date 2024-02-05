-- среднее количество докладов, сделанных студентами третьего факультета на конференциях;
USE conference_db_lab1;

SELECT f.number                AS faculty_number,
       AVG(presentation_count) AS average_presentations_per_student
    FROM faculty f
             JOIN
             uni_group ug ON f.id = ug.faculty_id
             JOIN
             student s ON ug.id = s.group_id
             LEFT JOIN (SELECT s.id        AS student_id,
                               COUNT(t.id) AS presentation_count
                            FROM student s
                                     LEFT JOIN
                                     topic t ON s.id = t.author_id
                            GROUP BY s.id) AS student_presentations
                       ON s.id = student_presentations.student_id
    WHERE f.number = 3
    GROUP BY f.number;
