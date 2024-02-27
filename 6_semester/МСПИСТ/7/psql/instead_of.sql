CREATE VIEW student_view AS SELECT * FROM student;

CREATE OR REPLACE FUNCTION student_insert() RETURNS TRIGGER AS $$
BEGIN
  INSERT INTO student(group_id, name) VALUES (NEW.group_id, NEW.name);
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER student_insert_trigger
INSTEAD OF INSERT ON student_view
FOR EACH ROW EXECUTE PROCEDURE student_insert();

CREATE OR REPLACE FUNCTION student_update() RETURNS TRIGGER AS $$
BEGIN
  UPDATE student SET group_id = NEW.group_id, name = NEW.name WHERE id = OLD.id;
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER student_update_trigger
INSTEAD OF UPDATE ON student_view
FOR EACH ROW EXECUTE PROCEDURE student_update();

CREATE OR REPLACE FUNCTION student_delete() RETURNS TRIGGER AS $$
BEGIN
  DELETE FROM student WHERE id = OLD.id;
  RETURN OLD;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER student_delete_trigger
INSTEAD OF DELETE ON student_view
FOR EACH ROW EXECUTE PROCEDURE student_delete();