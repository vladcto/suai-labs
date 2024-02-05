-- темы докладов студентов для заданной группы
USE conference_db_lab1;

SELECT title
    FROM topic
             JOIN student sd ON topic.author_id = sd.id
             JOIN uni_group grp ON grp.id = sd.group_id
    WHERE grp.id = 5;