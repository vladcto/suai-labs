-- количество докладов для каждой конференции;
USE conference_db_lab1;

# SET profiling = 1;

EXPLAIN ANALYZE 
SELECT c.id              AS conference_id,
       COUNT(a.topic_id) AS report_count
  FROM conference c
         JOIN
         conference_session cs ON c.id = cs.conference_id
         JOIN
         topic t ON cs.id = t.session_id
         JOIN
         authorship a ON t.id = a.topic_id
  GROUP BY c.id;

# SHOW PROFILES;
