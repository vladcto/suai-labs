-- Длительность конференции
USE conference_db_lab1;

SELECT c.name AS conferencename, DATEDIFF(MAX(cs.date), MIN(cs.date)) + 1 AS duration
    FROM conference_session cs
             JOIN conference c ON cs.conference_id = c.id
    GROUP BY c.name;