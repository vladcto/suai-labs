INSERT INTO university (name)
  VALUES ('СПбГУ');

INSERT INTO faculty
  VALUES (1, 1, 1);

INSERT INTO uni_group (faculty_id, name)
  VALUES (1, 'Группа 1');

INSERT INTO student (group_id, name)
  VALUES (1, 'Клон 1');

INSERT INTO conference (name, place, theme)
  VALUES ('Научная конференция', 'ГУАП', 'Искусственный интеллект');

INSERT INTO conference_session (conference_id, start_time, end_time)
  VALUES (1, '2022-01-01 10:00:00', '2022-01-01 18:00:00');

INSERT INTO topic (title, session_id)
  VALUES ('Тема 1', 1);

INSERT INTO authorship (author_id, topic_id)
  VALUES (1, 1);