# USE conference_db_lab1;
# 
# INSERT INTO university(name) VALUES ('ТЕСТ');
# 
# SELECT * FROM faculty WHERE university_id = (SELECT id FROM university WHERE name = 'ТЕСТ');
# 
# UPDATE uni_group SET name = 'ТЕСТ2' WHERE id = 1;
# 
# SELECT * FROM student WHERE group_id = 1;

SELECT * from authorship_history;
