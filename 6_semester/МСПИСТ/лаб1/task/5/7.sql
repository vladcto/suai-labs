-- студентов четвертого факультета, не выступавших на конференциях
USE conference_db_lab1;

SELECT s.id   AS student_id,
       s.name AS student_name
    FROM faculty f
             JOIN
             uni_group ug ON f.id = ug.faculty_id
             JOIN
             student s ON ug.id = s.group_id
    WHERE f.number = 4
      AND s.id NOT IN (SELECT DISTINCT author_id FROM topic);
