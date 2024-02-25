USE conference_db_lab1;

DELIMITER //
CREATE FUNCTION GetFacultyStudentCount(faculty_id INT) RETURNS INT
  DETERMINISTIC
BEGIN
  DECLARE student_count INT;
  SELECT COUNT(DISTINCT s.id)
    INTO student_count
    FROM student s
           INNER JOIN uni_group g ON s.group_id = g.id
    WHERE g.faculty_id = faculty_id;
  RETURN student_count;
END//
DELIMITER ;

DELIMITER //
CREATE PROCEDURE GetFacultyStatistics()
BEGIN
  CREATE TEMPORARY TABLE IF NOT EXISTS FacultyStatistics AS
  SELECT f.id                         AS faculty_id,
         COUNT(DISTINCT g.id)         AS group_count,
         GetFacultyStudentCount(f.id) AS student_count
    FROM faculty f
           LEFT JOIN
           uni_group g ON f.id = g.faculty_id
    GROUP BY f.id;

  SELECT * FROM FacultyStatistics;
END//
DELIMITER ;

CALL GetFacultyStatistics();
# noinspection SqlResolve
SELECT *
  FROM FacultyStatistics;