-- количество докладов для каждой конференции;
USE conference_db_lab1;

SELECT c.id              AS conference_id,
       c.name            AS conference_name,
       COUNT(a.topic_id) AS report_count
    FROM conference c
             JOIN
             conference_session cs ON c.id = cs.conference_id
             JOIN
             topic t ON cs.id = t.session_id
             JOIN
             authorship a ON t.id = a.topic_id
    GROUP BY c.id, c.name;