USE conference_db_lab1;

-- Получаем ошибку, так как нет uni_group с ключем = 9999
INSERT INTO student (group_id, name)
    VALUES (9999, 'Кто я');