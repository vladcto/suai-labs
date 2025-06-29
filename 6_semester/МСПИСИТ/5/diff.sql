USE conference_db_lab1;

DROP TEMPORARY TABLE IF EXISTS temp_students;
CREATE TEMPORARY TABLE temp_students AS
SELECT s.id, s.name
  FROM student s
  WHERE s.id <= 5
UNION
SELECT NULL, 'Аноним';

SELECT  * FROM temp_students;

SELECT s.id, s.name
  FROM student s
  WHERE NOT EXISTS (SELECT NULL FROM temp_students ts WHERE ts.id = s.id);

SELECT s.id, s.name
  FROM student s
  WHERE s.id NOT IN (SELECT ts.id FROM temp_students ts);