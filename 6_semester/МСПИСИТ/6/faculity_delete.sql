USE conference_db_lab1;

DELIMITER //
CREATE PROCEDURE DeleteFacultyCascade(IN faculty_id INT)
BEGIN
  DELETE student
    FROM student
           INNER JOIN uni_group ON student.group_id = uni_group.id
    WHERE uni_group.faculty_id = faculty_id;

  DELETE FROM uni_group WHERE uni_group.faculty_id = faculty_id;

  DELETE FROM faculty WHERE id = faculty_id;
END//
DELIMITER ;

CALL DeleteFacultyCascade(1);