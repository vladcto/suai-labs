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
    university_id INT,
    number        INT NOT NULL UNIQUE,
    FOREIGN KEY (university_id) REFERENCES university (id)
);

CREATE TABLE IF NOT EXISTS uni_group
(
    id         INT PRIMARY KEY AUTO_INCREMENT,
    faculty_id INT,
    name       VARCHAR(50) NOT NULL UNIQUE,
    FOREIGN KEY (faculty_id) REFERENCES faculty (id)
);

CREATE TABLE IF NOT EXISTS student
(
    id       INT PRIMARY KEY AUTO_INCREMENT,
    group_id INT,
    name     VARCHAR(100) NOT NULL,
    CONSTRAINT fk_group_id FOREIGN KEY (group_id) REFERENCES uni_group (id)
);

CREATE TABLE IF NOT EXISTS conference
(
    id   INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    date DATE         NOT NULL
);

CREATE TABLE IF NOT EXISTS topic
(
    id            INT PRIMARY KEY AUTO_INCREMENT,
    conference_id INT,
    author_id     INT,
    title         VARCHAR(255) NOT NULL,
    CONSTRAINT fk_author_id FOREIGN KEY (author_id) REFERENCES student (id),
    CONSTRAINT fk_conference_id FOREIGN KEY (conference_id) REFERENCES conference (id)
);

CREATE TABLE IF NOT EXISTS conference_program
(
    program_id    INT PRIMARY KEY AUTO_INCREMENT,
    conference_id INT,
    topic_id      INT,
    start_time    TIME NOT NULL,
    end_time      TIME NOT NULL,
    CONSTRAINT fk_conf_id_program FOREIGN KEY (conference_id) REFERENCES conference (id),
    CONSTRAINT fk_topic_id_program FOREIGN KEY (topic_id) REFERENCES topic (id)
);
