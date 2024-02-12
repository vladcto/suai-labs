USE conference_db_lab1;

-- Удаляем констрейнты, чтобы можно было спокойно удалить конференцию
ALTER TABLE conference_program
    DROP CONSTRAINT fk_conf_id_program;

DELETE
    FROM conference
    WHERE id = 1;
