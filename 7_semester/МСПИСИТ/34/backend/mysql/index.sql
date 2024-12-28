USE conference;

CREATE INDEX idx_users_token ON Users(token);

CREATE INDEX idx_conferences_city ON Conferences(city_id);
CREATE INDEX idx_conferences_topic ON Conferences(topic_id);
