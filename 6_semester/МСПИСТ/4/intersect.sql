-- Темы, над которыми работал студент студент 1 и студент 2
USE conference_db_lab1;

SELECT t.title
    FROM topic t
             JOIN authorship a ON t.id = a.topic_id
    WHERE a.author_id = 1

INTERSECT

SELECT t.title
    FROM topic t
             JOIN authorship a ON t.id = a.topic_id
    WHERE a.author_id = 2;