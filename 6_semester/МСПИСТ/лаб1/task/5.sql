-- среднее количество докладов, сделанных студентами третьего факультета на конференциях;
USE conference_db_lab1;

SELECT AVG(topic_count) AS avg_topic_count
    FROM (SELECT COUNT(t.id) AS topic_count
              FROM student s
                       JOIN
                       uni_group g ON s.group_id = g.id
                       JOIN
                       faculty f ON g.faculty_id = f.id
                       JOIN
                       topic t ON s.id = t.author_id
              WHERE f.number = 3
              GROUP BY s.id) AS subquery;
