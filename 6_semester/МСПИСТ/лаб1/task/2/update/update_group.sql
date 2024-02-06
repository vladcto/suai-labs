USE conference_db_lab1;

UPDATE uni_group
SET name = CONCAT(CAST(id AS CHAR), name);