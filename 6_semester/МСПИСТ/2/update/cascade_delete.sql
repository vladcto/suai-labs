USE conference_db_lab1;

-- Обновляем таблицы для возможности каскадного удаления
ALTER TABLE uni_group
    DROP CONSTRAINT uni_group_ibfk_1;

ALTER TABLE uni_group
    ADD CONSTRAINT uni_group_ibfk_1
        FOREIGN KEY (faculty_id) REFERENCES faculty (id) ON DELETE CASCADE;

ALTER TABLE student
    DROP CONSTRAINT fk_group_id;

ALTER TABLE student
    ADD CONSTRAINT fk_group_id
        FOREIGN KEY (group_id) REFERENCES uni_group (id) ON DELETE CASCADE;

ALTER TABLE conference_program
    DROP CONSTRAINT fk_topic_id_program;

ALTER TABLE conference_program
    ADD CONSTRAINT fk_topic_id_program
        FOREIGN KEY (topic_id) REFERENCES topic (id) ON DELETE CASCADE;

ALTER TABLE authorship
    DROP CONSTRAINT fk_author_id;

ALTER TABLE authorship
    ADD CONSTRAINT fk_author_id FOREIGN KEY (author_id) REFERENCES student (id) ON DELETE CASCADE;

DELETE
    FROM faculty
    WHERE id = 1;