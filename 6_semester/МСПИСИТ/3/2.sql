-- темы докладов студентов для заданной группы
USE conference_db_lab1;

SELECT DISTINCT title AS topic
    FROM topic
             JOIN authorship au ON topic.id = au.topic_id
             JOIN student sd ON au.author_id = sd.id
             JOIN uni_group grp ON grp.id = sd.group_id
    WHERE grp.name IN ('1');