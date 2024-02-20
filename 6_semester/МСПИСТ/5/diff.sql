USE conference_db_lab1;

DROP VIEW IF EXISTS authors;
CREATE VIEW authors AS
SELECT a.author_id
    FROM authorship a;

-- Все студенты, которые являются авторами хотя бы одной темы
SELECT s.name
    FROM student s
    WHERE s.id IN (SELECT author_id FROM authors);

-- Всех студенты, которые не являются авторами ни одной темы
SELECT s.name
    FROM student s
    WHERE s.id NOT IN (SELECT author_id FROM authors);

-- Все студенты, которые являются авторами хотя бы одной темы
SELECT s.name
    FROM student s
    WHERE s.id IN (SELECT author_id FROM authors);

-- Всех студенты, которые не являются авторами ни одной темы
SELECT s.name
    FROM student s
    WHERE s.id NOT IN (SELECT author_id FROM authors);