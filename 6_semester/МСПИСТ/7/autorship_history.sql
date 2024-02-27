USE conference_db_lab1;

CREATE TABLE IF NOT EXISTS authorship_history
(
  id          INT PRIMARY KEY AUTO_INCREMENT,
  author_id   INT         NOT NULL,
  topic_id    INT         NOT NULL,
  change_type VARCHAR(10) NOT NULL,
  change_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Создаем триггеры для отслеживания изменений в таблице authorship
DELIMITER //
CREATE TRIGGER authorship_after_insert
  AFTER INSERT
  ON authorship
  FOR EACH ROW
BEGIN
  INSERT INTO authorship_history (author_id, topic_id, change_type)
    VALUES (NEW.author_id, NEW.topic_id, 'INSERT');
END;
//

CREATE TRIGGER authorship_after_delete
  AFTER DELETE
  ON authorship
  FOR EACH ROW
BEGIN
  INSERT INTO authorship_history (author_id, topic_id, change_type)
    VALUES (OLD.author_id, OLD.topic_id, 'DELETE');
END;
//

CREATE TRIGGER authorship_after_update
  AFTER UPDATE
  ON authorship
  FOR EACH ROW
BEGIN
  INSERT INTO authorship_history (author_id, topic_id, change_type)
    VALUES (NEW.author_id, NEW.topic_id, 'UPDATE');
END;
//
DELIMITER ;