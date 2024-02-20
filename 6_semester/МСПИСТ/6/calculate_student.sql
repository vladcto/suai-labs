USE conference_db_lab1;

DELIMITER //
CREATE FUNCTION GetReportCountForUniversity(university_id INT) RETURNS INT
BEGIN
    DECLARE report_count INT;

    SELECT COUNT(*) INTO report_count
    FROM authorship
    JOIN student ON authorship.author_id = student.id
    JOIN uni_group ON student.group_id = uni_group.id
    JOIN faculty ON uni_group.faculty_id = faculty.id
    WHERE faculty.university_id = university_id;

    RETURN report_count;
END//
DELIMITER ;

SELECT GetReportCountForUniversity(1);