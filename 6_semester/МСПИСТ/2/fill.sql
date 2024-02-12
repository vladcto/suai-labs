USE conference_db_lab1;

INSERT INTO university (name)
    VALUES ('ГУАП'),
           ('Не ГУАП');

INSERT INTO faculty (university_id, number)
    VALUES (1, 1),
           (1, 2),
           (1, 3),
           (2, 4);

INSERT INTO uni_group (faculty_id, name)
    VALUES (1, '1'),
           (2, '2'),
           (3, '3'),
           (4, '4');

INSERT INTO student (group_id, name)
    VALUES (1, 'Клон 1'),
           (2, 'Клон 2'),
           (2, 'Клон 3'),
           (3, 'Клон 4'),
           (4, 'Клон 5'),
           (4, 'Клон 6'),
           (1, 'Клон 7'),
           (1, 'Клон 8');

INSERT INTO conference (name, date)
    VALUES ('Информатика', '2022-01-01'),
           ('Математика', '2022-02-01'),
           ('Физика', '2022-03-01'),
           ('Химия', '2022-04-01');

INSERT INTO topic (title)
    VALUES ('Topic 1'),
           ('Topic 2'),
           ('Topic 3'),
           ('Topic 4'),
           ('Topic 5'),
           ('Topic 6'),
           ('Topic 7'),
           ('Topic 8');

INSERT INTO authorship (author_id, topic_id)
    VALUES (1, 1), 
           (2, 1),
           (1, 2),
           (3, 3),
           (1, 4),
           (4, 5),
           (1, 6),
           (5, 7),
           (7, 8),
           (8, 8);

INSERT INTO conference_program (conference_id, topic_id, start_time, end_time)
    VALUES (1, 1, '09:00:00', '10:00:00'),
           (1, 2, '10:00:00', '11:00:00'),
           (2, 3, '09:00:00', '10:00:00'),
           (2, 4, '10:00:00', '11:00:00'),
           (3, 5, '09:00:00', '10:00:00'),
           (3, 6, '10:00:00', '11:00:00'),
           (4, 7, '09:00:00', '10:00:00'),
           (4, 8, '10:00:00', '11:00:00');