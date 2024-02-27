CREATE TABLE IF NOT EXISTS university
(
  id   SERIAL PRIMARY KEY,
  name VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS faculty
(
  id            SERIAL PRIMARY KEY,
  university_id INT NOT NULL,
  number        INT NOT NULL UNIQUE,
  FOREIGN KEY (university_id) REFERENCES university (id)
);

CREATE TABLE IF NOT EXISTS uni_group
(
  id         SERIAL PRIMARY KEY,
  faculty_id INT         NOT NULL,
  name       VARCHAR(50) NOT NULL UNIQUE,
  FOREIGN KEY (faculty_id) REFERENCES faculty (id)
);

CREATE TABLE IF NOT EXISTS student
(
  id       SERIAL PRIMARY KEY,
  group_id INT NOT NULL,
  name     VARCHAR(100),
  FOREIGN KEY (group_id) REFERENCES uni_group (id)
);

CREATE TABLE IF NOT EXISTS conference
(
  id    SERIAL PRIMARY KEY,
  name  VARCHAR(100) NOT NULL DEFAULT 'Научная конференция',
  place VARCHAR(100) NOT NULL DEFAULT 'ГУАП',
  theme VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS conference_session
(
  id            SERIAL PRIMARY KEY,
  conference_id INT  NOT NULL,
  start_time    TIMESTAMP NOT NULL,
  end_time      TIMESTAMP NOT NULL
);

CREATE TABLE IF NOT EXISTS topic
(
  id         SERIAL PRIMARY KEY,
  title      VARCHAR(255) NOT NULL,
  session_id INT          NOT NULL
);

CREATE TABLE IF NOT EXISTS authorship
(
  author_id INT NOT NULL,
  topic_id  INT NOT NULL,
  PRIMARY KEY (author_id, topic_id)
);