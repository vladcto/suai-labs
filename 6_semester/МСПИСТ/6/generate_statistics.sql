-- формирование статистики во временной таблице

USE conference_db_lab1;

DELIMITER //
CREATE PROCEDURE GenerateStatistics()
BEGIN
  CREATE TEMPORARY TABLE IF NOT EXISTS faculty_statistics
  (
    faculty_id    INT,
    group_count   INT,
    student_count INT
  );

  INSERT INTO faculty_statistics (faculty_id, group_count, student_count)
  SELECT f.id                 AS faculty_id,
         COUNT(DISTINCT g.id) AS group_count,
         COUNT(DISTINCT s.id) AS student_count
    FROM faculty f
           LEFT JOIN
           uni_group g ON f.id = g.faculty_id
           LEFT JOIN
           student s ON g.id = s.group_id
    GROUP BY f.id;
END//
DELIMITER ;

CALL GenerateStatistics();
# noinspection SqlResolve
SELECT *
  FROM faculty_statistics;