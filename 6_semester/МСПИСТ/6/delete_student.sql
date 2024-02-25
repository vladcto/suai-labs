-- удаляется информация о студенте, если в его группе нет больше студентов, 
-- удаляется из таблицы с перечнем групп
USE conference_db_lab1;

DELIMITER //
CREATE PROCEDURE DeleteStudentAndCleanGroup(IN student_id INT)
BEGIN
  DECLARE s_group_id INT;

  SELECT group_id INTO s_group_id FROM student WHERE id = student_id;

  DELETE FROM student WHERE id = student_id;

  IF (SELECT COUNT(*) FROM student WHERE group_id = s_group_id) = 0 THEN
    DELETE FROM uni_group WHERE id = s_group_id;
  END IF;
END//
DELIMITER ;

CALL DeleteStudentAndCleanGroup(9);