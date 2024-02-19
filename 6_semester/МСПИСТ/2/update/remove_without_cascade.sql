USE conference_db_lab1;

-- Удаляем констрейнты, чтобы можно было спокойно удалить конференцию
ALTER TABLE conference_session
    DROP FOREIGN KEY fk_conf_id_session;

DELETE
    FROM conference
    WHERE id = 1;