-- количество докладов для каждой конференции
USE conference_db_lab1;

SELECT c.id        AS conference_id,
       c.name      AS conference_name,
       COUNT(t.id) AS number_of_presentations
    FROM conference c
             LEFT JOIN
             topic t ON c.id = t.conference_id
    GROUP BY c.id;