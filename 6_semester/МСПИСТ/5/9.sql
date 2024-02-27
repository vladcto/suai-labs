-- пары студентов, всегда выступающие вместе.
USE conference_db_lab1;

SELECT a1.author_id AS student1, a2.author_id AS student2
  FROM authorship a1
         JOIN authorship a2 ON a1.topic_id = a2.topic_id AND a1.author_id < a2.author_id
  WHERE NOT EXISTS (SELECT 1
                      FROM authorship
                      WHERE author_id = a2.author_id
                        AND topic_id != a1.topic_id)
    AND NOT EXISTS (SELECT 1
                      FROM authorship
                      WHERE author_id = a1.author_id
                        AND topic_id != a2.topic_id)
  GROUP BY a1.author_id, a2.author_id;