-- Проверка триггера after_university_insert
INSERT INTO university(name) VALUES ('Test University');

-- Проверьте, создался ли новый факультет с university_id, соответствующим ID нового университета
SELECT * FROM faculty WHERE university_id = (SELECT id FROM university WHERE name = 'Test University');

-- Проверка триггера after_uni_group_update
UPDATE uni_group SET name = 'Updated Group' WHERE id = 1;

-- Проверьте, обновлены ли имена студентов, принадлежащих этой группе
SELECT * FROM student WHERE group_id = 1;

-- Проверка триггера after_university_delete
DELETE FROM university WHERE name = 'Test University';

-- Проверьте, удалены ли факультеты, связанные с удаленным университетом
SELECT * FROM faculty WHERE university_id = (SELECT id FROM university WHERE name = 'Test University');