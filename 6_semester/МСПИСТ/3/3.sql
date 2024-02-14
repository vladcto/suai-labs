-- выступления, подготовленные двумя студентами различных факультетов;
USE conference_db_lab1;

SELECT t1.title AS topic,
       s1.name  AS student1,
       s2.name  AS student2
    FROM topic t1
             JOIN
             authorship au1 ON au1.author_id = t1.id = au1.topic_id
             JOIN
             student s1 ON au1.author_id = s1.id
             JOIN
             uni_group g1 ON s1.group_id = g1.id
             JOIN
             faculty f1 ON g1.faculty_id = f1.id
                 # for second
             JOIN
             topic t2 ON t1.id < t2.id
             JOIN
             authorship au2 ON au2.author_id = t2.id = au2.topic_id
             JOIN
             student s2 ON au2.author_id = s2.id
             JOIN
             uni_group g2 ON s2.group_id = g2.id
             JOIN
             faculty f2 ON g2.faculty_id = f2.id
    WHERE f1.id
    ORDER BY s1.name AND f1.id <> f2.id;