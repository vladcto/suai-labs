-- пары студентов, всегда выступающие вместе.

USE conference_db_lab1;

SELECT t1.author_id AS student1_id,
       s1.name      AS student1_name,
       t2.author_id AS student2_id,
       s2.name      AS student2_name
    FROM topic t1
             JOIN
             topic t2 ON t1.conference_id = t2.conference_id AND t1.id < t2.id
             JOIN
             student s1 ON t1.author_id = s1.id
             JOIN
             student s2 ON t2.author_id = s2.id
    WHERE s1.id <> s2.id
    GROUP BY t1.author_id, t2.author_id
    HAVING COUNT(DISTINCT t1.conference_id) = (SELECT COUNT(DISTINCT id) FROM conference);
