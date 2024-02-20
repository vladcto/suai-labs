USE conference_db_lab1;

-- Все студенты, которые являются авторами хотя бы одной темы
SELECT s.name
    FROM student s
    WHERE EXISTS (SELECT 1
                      FROM authorship a
                      WHERE a.author_id = s.id);

-- Всех студенты, которые не являются авторами ни одной темы
SELECT s.name
    FROM student s
    WHERE NOT EXISTS (SELECT 1
                          FROM authorship a
                          WHERE a.author_id = s.id);

-- Все студенты, которые являются авторами хотя бы одной темы
SELECT s.name
    FROM student s
    WHERE s.id IN (SELECT a.author_id
                       FROM authorship a);

-- Всех студенты, которые не являются авторами ни одной темы
SELECT s.name
    FROM student s
    WHERE s.id NOT IN (SELECT a.author_id
                           FROM authorship a);