USE conference;

CREATE TRIGGER after_conference_insert
AFTER INSERT ON Conferences
FOR EACH ROW
BEGIN
    INSERT INTO ConferenceAttendance (user_username, conference_id)
    VALUES (NEW.author_username, NEW.id);
END;
