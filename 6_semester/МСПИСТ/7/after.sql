USE conference_db_lab1;

CREATE TRIGGER after_university_insert
  AFTER INSERT
  ON university
  FOR EACH ROW
BEGIN
  INSERT INTO faculty(university_id, number)
    VALUES (NEW.id, 1);
END;

CREATE TRIGGER after_uni_group_update
  AFTER UPDATE
  ON uni_group
  FOR EACH ROW
BEGIN
  UPDATE student
  SET name = CONCAT(name, ' (', NEW.name, ')')
    WHERE group_id = NEW.id;
END;

CREATE TRIGGER after_university_delete
  AFTER DELETE
  ON university
  FOR EACH ROW
BEGIN
  DELETE
    FROM faculty
    WHERE university_id = OLD.id;
END;