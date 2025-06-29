-- Унчитожаем студентов, не выступивших на конференциях;
USE conference_db_lab1;

DELETE FROM student
WHERE id NOT IN (SELECT author_id FROM authorship);