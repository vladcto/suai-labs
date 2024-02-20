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
           (1, NULL);

INSERT INTO conference (name, place, theme)
    VALUES ('Информатика', 'ГУАП', 'Тема 1'),
           ('Математика', 'ИТМО', 'Тема 2'),
           ('Физика', 'Политех', 'Тема 3'),
           ('Химия', 'УрФУ', 'Тема 4');

INSERT INTO conference_session (conference_id, start_time, end_time, date)
    VALUES (1, '09:00:00', '18:00:00', '2022-01-01'),
           (1, '10:00:00', '18:00:00', '2022-01-02'),
           (2, '09:00:00', '19:00:00', '2022-02-05'),
           (2, '10:00:00', '19:00:00', '2022-02-07'),
           (3, '09:00:00', '20:00:00', '2022-03-11'),
           (3, '10:00:00', '18:00:00', '2022-03-12'),
           (4, '09:00:00', '15:00:00', '2022-04-25'),
           (4, '10:00:00', '21:00:00', '2022-04-26');

INSERT INTO topic (title, session_id)
    VALUES ('Topic 1', 1),
           ('Topic 2', 2),
           ('Topic 3', 3),
           ('Topic 4', 4),
           ('Topic 5', 5),
           ('Topic 6', 6),
           ('Topic 7', 7),
           ('Topic 8', 8),
           ('Topic 9', 3),
           ('Topic 10', 5),
           ('Topic 11', 7);

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
           (8, 8),
           (1, 9),
           (1, 10),
           (1, 11);