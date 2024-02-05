USE conference_db_lab1;

-- Добавление данных в таблицу ВУЗ
INSERT INTO university (name)
    VALUES ('МГУ');
INSERT INTO university (name)
    VALUES ('СПбГУ');
INSERT INTO university (name)
    VALUES ('ТГУ');

-- Добавление данных в таблицу Факультет
INSERT INTO faculty (university_id, number)
    VALUES (1, 3);
INSERT INTO faculty (university_id, number)
    VALUES (1, 2);
INSERT INTO faculty (university_id, number)
    VALUES (2, 1);
INSERT INTO faculty (university_id, number)
    VALUES (3, 4);

-- Добавление данных в таблицу Группа
INSERT INTO uni_group (faculty_id, name)
    VALUES (1, '101');
INSERT INTO uni_group (faculty_id, name)
    VALUES (1, '102');
INSERT INTO uni_group (faculty_id, name)
    VALUES (2, 'IT-101');
INSERT INTO uni_group (faculty_id, name)
    VALUES (2, 'IT-102');
INSERT INTO uni_group (faculty_id, name)
    VALUES (3, 'Г-01');
INSERT INTO uni_group (faculty_id, name)
    VALUES (3, 'Г-02');

-- Добавление данных в таблицу Студент
INSERT INTO student (group_id, name)
    VALUES (1, 'Иван Иванов');
INSERT INTO student (group_id, name)
    VALUES (1, 'Ольга Смирнова');
INSERT INTO student (group_id, name)
    VALUES (2, 'Алексей Петров');
INSERT INTO student (group_id, name)
    VALUES (2, 'Мария Кузнецова');
INSERT INTO student (group_id, name)
    VALUES (3, 'Дмитрий Соколов');
INSERT INTO student (group_id, name)
    VALUES (4, 'Екатерина Иванова');
INSERT INTO student (group_id, name)
    VALUES (5, 'Андрей Козлов');
INSERT INTO student (group_id, name)
    VALUES (6, 'София Морозова');

-- Добавление данных в таблицу Конференция
INSERT INTO conference (name, date)
    VALUES ('Научная конференция по физике', '2024-03-15');
INSERT INTO conference (name, date)
    VALUES ('IT-конференция', '2024-04-20');
INSERT INTO conference (name, date)
    VALUES ('Лингвистическая конференция', '2024-05-25');

-- Добавление данных в таблицу Тема доклада
INSERT INTO topic (conference_id, title)
    VALUES (1, 'Новые тенденции в квантовой физике');
INSERT INTO topic (conference_id, title)
    VALUES (1, 'Астрофизика в XXI веке');
INSERT INTO topic (conference_id, title)
    VALUES (2, 'Развитие искусственного интеллекта');
INSERT INTO topic (conference_id, title)
    VALUES (2, 'Бигдата и анализ данных');
INSERT INTO topic (conference_id, title)
    VALUES (3, 'Современные языковые тенденции');
INSERT INTO topic (conference_id, title)
    VALUES (3, 'Лингвистика и культура');

-- Добавление данных в таблицу Программа конференции
INSERT INTO conference_program (conference_id, topic_id, start_time, end_time)
    VALUES (1, 1, '10:00', '12:00');
INSERT INTO conference_program (conference_id, topic_id, start_time, end_time)
    VALUES (1, 2, '14:00', '16:00');
INSERT INTO conference_program (conference_id, topic_id, start_time, end_time)
    VALUES (2, 3, '11:00', '13:00');
INSERT INTO conference_program (conference_id, topic_id, start_time, end_time)
    VALUES (2, 4, '15:00', '17:00');
INSERT INTO conference_program (conference_id, topic_id, start_time, end_time)
    VALUES (3, 5, '09:30', '11:30');
INSERT INTO conference_program (conference_id, topic_id, start_time, end_time)
    VALUES (3, 6, '13:30', '15:30');
