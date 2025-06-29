USE conference_db_lab1;

ALTER TABLE faculty
  ADD UNIQUE INDEX idx_faculty_number (number);

CREATE INDEX idx_conference_name ON conference(name);
CREATE INDEX idx_conference_id ON conference(id);

CREATE INDEX idx_uni_group_faculty_id ON uni_group(faculty_id);
CREATE INDEX idx_student_group_id ON student(group_id);
CREATE INDEX idx_authorship_author_id ON authorship(author_id);
CREATE INDEX idx_authorship_topic_id ON authorship(topic_id);
CREATE INDEX idx_topic_session_id ON topic(session_id);
CREATE INDEX idx_conference_session_conference_id ON conference_session(conference_id);

CREATE INDEX idx_conference_session_date_time ON conference_session(date, start_time);

CREATE INDEX idx_student_name ON student(name);

CREATE INDEX idx_faculty_university_id ON faculty(university_id);
