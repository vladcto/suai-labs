CREATE DATABASE IF NOT EXISTS conference_db_lab1;

USE conference_db_lab1;

CREATE TABLE IF NOT EXISTS university
(
    id   INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS faculty
(
    id            INT PRIMARY KEY AUTO_INCREMENT,
    university_id INT NOT NULL,
    number        INT NOT NULL UNIQUE,
    FOREIGN KEY (university_id) REFERENCES university (id)
);

CREATE TABLE IF NOT EXISTS uni_group
(
    id         INT PRIMARY KEY AUTO_INCREMENT,
    faculty_id INT         NOT NULL,
    name       VARCHAR(50) NOT NULL UNIQUE,
    FOREIGN KEY (faculty_id) REFERENCES faculty (id)
);

CREATE TABLE IF NOT EXISTS student
(
    id       INT PRIMARY KEY AUTO_INCREMENT,
    group_id INT          NOT NULL,
    name     VARCHAR(100),
    CONSTRAINT fk_group_id FOREIGN KEY (group_id) REFERENCES uni_group (id)
);

CREATE TABLE IF NOT EXISTS conference
(
    id   INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL DEFAULT 'Научная конференция',
    place VARCHAR(100) NOT NULL DEFAULT 'ГУАП',
    theme VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS conference_session
(
    id            INT PRIMARY KEY AUTO_INCREMENT,
    conference_id INT  NOT NULL,
    start_time    TIME NOT NULL,
    end_time      TIME NOT NULL,
    date          DATE NOT NULL,
    CONSTRAINT fk_conf_id_session FOREIGN KEY (conference_id) REFERENCES conference (id),
    CONSTRAINT check_time CHECK (start_time < end_time)
);

CREATE TABLE IF NOT EXISTS topic
(
    id         INT PRIMARY KEY AUTO_INCREMENT,
    title      VARCHAR(255) NOT NULL,
    session_id INT          NOT NULL,
    CONSTRAINT fk_session_id_topic FOREIGN KEY (session_id) REFERENCES conference_session (id)
);

CREATE TABLE IF NOT EXISTS authorship
(
    author_id INT NOT NULL,
    topic_id  INT NOT NULL,
    CONSTRAINT pk_authorship PRIMARY KEY (author_id, topic_id),
    CONSTRAINT fk_author_id FOREIGN KEY (author_id) REFERENCES student (id) ON DELETE CASCADE,
    CONSTRAINT fk_topic_id FOREIGN KEY (topic_id) REFERENCES topic (id)
);
