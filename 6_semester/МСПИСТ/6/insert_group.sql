-- ставляется информация о студенте, если указанный номер группы отсутствует 
-- в БД, запись добавляется в таблицу с перечнем групп
USE conference_db_lab1;

DELIMITER //
CREATE PROCEDURE
  InsertStudentWithGroupCheck(IN student_name VARCHAR(100),
                              IN group_name VARCHAR(50),
                              IN faculty_id_int INT)
BEGIN
  DECLARE group_id INT;

  SELECT id INTO group_id FROM uni_group WHERE name = group_name;

  IF group_id IS NULL THEN
    INSERT INTO uni_group (name, faculty_id) VALUES (group_name, faculty_id_int);
    SET group_id = LAST_INSERT_ID();
  END IF;

  INSERT INTO student (name, group_id) VALUES (student_name, group_id);
END //
DELIMITER ;

CALL InsertStudentWithGroupCheck('Новый', 'Новая', 1)