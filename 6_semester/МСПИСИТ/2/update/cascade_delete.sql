USE conference_db_lab1;

-- Обновляем таблицы для возможности каскадного удаления
ALTER TABLE uni_group
    DROP FOREIGN KEY uni_group_ibfk_1;

ALTER TABLE uni_group
    ADD CONSTRAINT uni_group_ibfk_1
        FOREIGN KEY (faculty_id) REFERENCES faculty (id) ON DELETE CASCADE;

ALTER TABLE student
    DROP FOREIGN KEY fk_group_id;

ALTER TABLE student
    ADD CONSTRAINT fk_group_id
        FOREIGN KEY (group_id) REFERENCES uni_group (id) ON DELETE CASCADE;

ALTER TABLE topic
    DROP FOREIGN KEY fk_session_id_topic;

ALTER TABLE topic
    ADD CONSTRAINT fk_session_id_topic
        FOREIGN KEY (session_id) REFERENCES conference_session (id) ON DELETE CASCADE;

ALTER TABLE authorship
    DROP FOREIGN KEY fk_author_id;

ALTER TABLE authorship
    ADD CONSTRAINT fk_author_id FOREIGN KEY (author_id) REFERENCES student (id) ON DELETE CASCADE;

DELETE
    FROM faculty
    WHERE id = 1;