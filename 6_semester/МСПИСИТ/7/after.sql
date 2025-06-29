USE conference_db_lab1;

CREATE TRIGGER after_university_insert
  AFTER INSERT
  ON university
  FOR EACH ROW
BEGIN
  INSERT INTO faculty(university_id, number)
    VALUES (NEW.id, 99);
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