
USE conference; 

CREATE PROCEDURE RegisterNewUser(
    IN new_username VARCHAR(255),
    IN new_password_hash VARCHAR(255),
    IN new_token VARCHAR(255),
    OUT resulting_token VARCHAR(255)
)
BEGIN
    DECLARE existing_token VARCHAR(255) DEFAULT NULL;

    SELECT token INTO existing_token
    FROM Users
    WHERE username = new_username;
    
    IF existing_token IS NOT NULL THEN
        SET resulting_token = existing_token;
    ELSE
        INSERT INTO Users (username, password_hash, token)
        VALUES (new_username, new_password_hash, new_token);

        SET resulting_token = new_token;
    END IF;
END;
