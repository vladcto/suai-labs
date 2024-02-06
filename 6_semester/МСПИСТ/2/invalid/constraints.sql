USE conference_db_lab1;

-- Получаем ошибку, так как end_time < start_time
UPDATE conference_program
SET end_time = '00:00:00'
    WHERE program_id = 1;
