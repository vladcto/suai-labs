-- студентов первого факультета, выступавших на конференции Информатика
USE conference_db_lab1;

SELECT DISTINCT student.name
    FROM student
             JOIN uni_group ug ON ug.id = student.group_id
             JOIN faculty f ON f.id = ug.faculty_id
             JOIN authorship au on au.author_id = student.id = au.author_id
             JOIN topic t ON student.id = au.topic_id
             JOIN conference_program cp ON t.id = cp.topic_id
             JOIN conference c ON c.id = cp.conference_id
    WHERE f.number = 1
      AND c.name = 'Информатика';