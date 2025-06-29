USE conference_db_lab1;

EXPLAIN ANALYZE 
SELECT
  c.id AS conference_id,
  COUNT(a.topic_id) AS report_count
  FROM conference c USE INDEX ()
         JOIN conference_session cs USE INDEX () ON c.id = cs.conference_id
         JOIN topic t USE INDEX () ON cs.id = t.session_id
         JOIN authorship a USE INDEX () ON t.id = a.topic_id
  GROUP BY c.id;
