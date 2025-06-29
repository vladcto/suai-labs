-- студентов первого факультета, выступавших на конференции Информатика
USE conference_db_lab1;

SELECT DISTINCT student.name
    FROM student
             JOIN uni_group ug ON ug.id = student.group_id
             JOIN faculty f ON f.id = ug.faculty_id
             JOIN authorship au ON au.author_id = student.id
             JOIN topic t ON t.id = au.topic_id
             JOIN conference_session cs ON cs.id = t.session_id
             JOIN conference c ON c.id = cs.conference_id
    WHERE f.number = 1
      AND c.name = 'Информатика';