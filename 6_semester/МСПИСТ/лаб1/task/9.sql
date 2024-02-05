-- пары студентов, всегда выступающие вместе.

USE conference_db_lab1;

SELECT s1.name AS student1,
       s2.name AS student2
    FROM student s1
             JOIN
             topic t1 ON s1.id = t1.author_id
             JOIN
             topic t2 ON t1.title = t2.title AND t1.author_id < t2.author_id
             JOIN
             student s2 ON t2.author_id = s2.id
    GROUP BY s1.name,
             s2.name
    HAVING COUNT(DISTINCT t1.conference_id) = COUNT(DISTINCT t2.conference_id);