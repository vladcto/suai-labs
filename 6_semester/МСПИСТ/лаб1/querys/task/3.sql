-- выступления, подготовленные двумя студентами различных факультетов;
use conference_db_lab1;

SELECT
    t.id AS topic_id,
    t.title AS topic_title,
    s1.id AS student1_id,
    s1.name AS student1_name,
    f1.id AS faculty1_id,
    f1.number AS faculty1_number,
    s2.id AS student2_id,
    s2.name AS student2_name,
    f2.id AS faculty2_id,
    f2.number AS faculty2_number
    FROM
        topic t
            JOIN
            student s1 ON t.author_id = s1.id
            JOIN
            uni_group ug1 ON s1.group_id = ug1.id
            JOIN
            faculty f1 ON ug1.faculty_id = f1.id
            JOIN
            student s2 ON t.author_id <> s1.id AND t.author_id = s2.id
            JOIN
            uni_group ug2 ON s2.group_id = ug2.id
            JOIN
            faculty f2 ON ug2.faculty_id = f2.id
    WHERE
        f1.id <> f2.id;
