INSERT INTO student_view (group_id, name)
  VALUES (1, 'Клон 11');

UPDATE student_view
SET name = 'Клон 12'
  WHERE name = 'Клон 11';

DELETE
  FROM groups_view
  WHERE id = 1;

SELECT *
  FROM student;

SELECT *
  FROM uni_group;