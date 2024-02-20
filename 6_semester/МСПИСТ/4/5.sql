-- среднее количество докладов, сделанных студентами третьего факультета на конференциях;
USE conference_db_lab1;

SELECT subquery.conference_id,
       AVG(report_count) AS average_reports
    FROM (SELECT cs.conference_id,
                 COUNT(a.topic_id) AS report_count
              FROM student s
                       JOIN
                       uni_group ug ON s.group_id = ug.id
                       JOIN
                       faculty f ON ug.faculty_id = f.id
                       JOIN
                       authorship a ON s.id = a.author_id
                       JOIN
                       topic t ON a.topic_id = t.id
                       JOIN
                       conference_session cs ON t.session_id = cs.id
              WHERE f.number = 3
              GROUP BY cs.conference_id) AS subquery
    GROUP BY conference_id;
