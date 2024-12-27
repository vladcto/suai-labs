CREATE DATABASE IF NOT EXISTS conference;

USE conference;

CREATE TABLE Users (
    username VARCHAR(255) PRIMARY KEY,
    password_hash VARCHAR(255) NOT NULL,
    token VARCHAR(255) NOT NULL,
);

CREATE TABLE Cities (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

CREATE TABLE Topics (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

CREATE TABLE Conferences (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    city_id INT,
    topic_id INT,
    author_username VARCHAR(255),
    start_date DATE,
    end_date DATE,
    description TEXT,
    contacts TEXT,
--    image_url VARCHAR(255),
    FOREIGN KEY (city_id) REFERENCES Cities(id),
    FOREIGN KEY (topic_id) REFERENCES Topics(id),
    FOREIGN KEY (author_username) REFERENCES Users(username)
);
