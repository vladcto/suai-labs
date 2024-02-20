USE conference_db_lab1;

SELECT theme AS name FROM conference
UNION
SELECT title AS name FROM topic;