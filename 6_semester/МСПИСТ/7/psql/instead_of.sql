CREATE OR REPLACE VIEW student_view AS
SELECT *
  FROM student;

CREATE OR REPLACE VIEW groups_view AS
SELECT *
  FROM uni_group;

CREATE OR REPLACE FUNCTION student_insert() RETURNS TRIGGER AS
$$
BEGIN
  INSERT INTO student(group_id, name) VALUES (new.group_id, new.name);
  RETURN new;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER student_insert_trigger
  INSTEAD OF INSERT
  ON student_view
  FOR EACH ROW
EXECUTE PROCEDURE student_insert();

CREATE OR REPLACE FUNCTION student_update() RETURNS TRIGGER AS
$$
BEGIN
  UPDATE student SET group_id = new.group_id, name = new.name WHERE id = old.id;
  RETURN new;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER student_update_trigger
  INSTEAD OF UPDATE
  ON student_view
  FOR EACH ROW
EXECUTE PROCEDURE student_update();

CREATE OR REPLACE FUNCTION group_remove() RETURNS TRIGGER AS
$$
BEGIN
  DELETE FROM student WHERE student.group_id = old.id;
  DELETE FROM uni_group WHERE uni_group.id = old.id;
  RETURN old;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER group_delete_trigger
  INSTEAD OF DELETE
  ON groups_view
  FOR EACH ROW
EXECUTE PROCEDURE group_remove();