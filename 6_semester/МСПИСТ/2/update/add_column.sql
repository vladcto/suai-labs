USE conference_db_lab1;

ALTER TABLE faculty
    ADD COLUMN name VARCHAR(255) DEFAULT ('НЕИЗВЕСТНЫЙ');

UPDATE faculty
SET name = 'Известный'
    WHERE id < 3;