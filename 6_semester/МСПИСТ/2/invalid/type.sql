USE conference_db_lab1;

-- Получаем ошибку, так как неверный формат данных
UPDATE conference_session
SET start_time = 'some_invalid_date'
    WHERE TRUE;
