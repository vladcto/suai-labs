INSERT INTO student_view (group_id, name) VALUES (1, 'Клон 11');

UPDATE student_view SET name = 'Клон 12' WHERE name = 'Клон 11';

DELETE FROM student_view WHERE name = 'Клон 12';

SELECT * FROM student;