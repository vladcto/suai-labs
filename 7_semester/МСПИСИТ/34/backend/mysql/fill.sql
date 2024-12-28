USE conference;

INSERT INTO Cities (name) VALUES
('New York'),
('Los Angeles'),
('Chicago'),
('Houston'),
('Phoenix'),
('Philadelphia'),
('San Antonio'),
('San Diego'),
('Dallas'),
('San Jose');

INSERT INTO Topics (name) VALUES
('Technology'),
('Healthcare'),
('Finance'),
('Education'),
('Environment'),
('Entertainment'),
('Sports'),
('Politics'),
('Science'),
('Art');

INSERT INTO Users (username, password_hash, token) VALUES
('john_doe', 'hashed_password_1', 'token_1'),
('jane_smith', 'hashed_password_2', 'token_2');

INSERT INTO Conferences (name, city_id, topic_id, author_username, start_date, end_date, description, contacts, image_url) VALUES
('Tech Conference 2023', 1, 1, 'john_doe', '2023-05-20', '2023-05-21', 'A conference about the latest in technology', 'email@example.com', 'http://image.url/pic1.jpg'),
('Healthcare Innovations', 2, 2, 'jane_smith', '2023-06-15', '2023-06-16', 'Exploring new horizons in healthcare', 'contact@example.com', 'http://image.url/pic2.jpg');
