-- студентов четвертого факультета, не выступавших на конференциях
USE conference_db_lab1;

SELECT s.name
    FROM student s
             JOIN uni_group g ON s.group_id = g.id
             JOIN faculty f ON g.faculty_id = f.id
    WHERE f.number = 4
      AND NOT EXISTS (SELECT 1
                          FROM authorship a
                          WHERE a.author_id = s.id);
