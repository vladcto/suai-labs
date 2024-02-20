USE conference_db_lab1;

DELIMITER //
CREATE PROCEDURE get_students_with_more_than_n_authorships(IN n_authorships INT)
BEGIN
  DECLARE total_students INT;
  DECLARE current_row INT DEFAULT 1;
  DECLARE student_id INT;
  DECLARE authorship_count INT;
  
  SELECT COUNT(*) INTO total_students FROM student;
  
  WHILE current_row <= total_students DO
    SELECT id INTO student_id FROM student LIMIT current_row, 1;
    SELECT COUNT(*) INTO authorship_count FROM authorship WHERE author_id = student_id;
    
    IF authorship_count > n_authorships THEN
      SELECT id, name FROM student WHERE id = student_id;
    END IF;
    
    SET current_row = current_row + 1;
  END WHILE;
END //
DELIMITER ;

CALL get_students_with_more_than_n_authorships(0);