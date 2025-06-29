import mysql.connector

db_config = {
    'host': 'localhost',
    'user': 'root', 
    'password': '',
    'database': 'conference_db_lab1',
    'charset': 'utf8mb4'
}

conn = mysql.connector.connect(**db_config)
cursor = conn.cursor()

universities = ['Университет ИТ', 'Технический университет', 'Государственный университет']

for uni_name in universities:
    cursor.execute("INSERT INTO university (name) VALUES (%s)", (uni_name,))
conn.commit()

number = 1
for university_id in range(1, 4):
    for _ in range(5):
        cursor.execute("INSERT INTO faculty (university_id, number) VALUES (%s, %s)", (university_id, number))
        number += 1
conn.commit()

for faculty_id in range(1, 16):
    cursor.execute("SELECT number FROM faculty WHERE id = %s", (faculty_id,))
    faculty_number = cursor.fetchone()[0]
    for group_number in range(1, 5):
        group_name = f'Группа {faculty_number}-{group_number}'
        cursor.execute("INSERT INTO uni_group (faculty_id, name) VALUES (%s, %s)", (faculty_id, group_name))
conn.commit()

for group_id in range(1, 61):
    for student_num in range(1, 21):
        student_name = f'Студент {student_num} группы {group_id}'
        cursor.execute("INSERT INTO student (group_id, name) VALUES (%s, %s)", (group_id, student_name))
conn.commit()

conferences = [
    ('Конференция по информатике', 'ГУАП', 'Информатика'),
    ('Конференция по математике', 'СПбГУ', 'Математика'),
    ('Конференция по физике', 'ЛГУ', 'Физика')
]

for conf in conferences:
    cursor.execute("INSERT INTO conference (name, place, theme) VALUES (%s, %s, %s)", conf)
conn.commit()

session_times = [
    ('09:00:00', '10:30:00'),
    ('10:45:00', '12:15:00'),
    ('13:15:00', '14:45:00'),
    ('15:00:00', '16:30:00'),
    ('16:45:00', '18:15:00')
]

conference_dates = {
    1: '2023-11-01',
    2: '2023-12-05',
    3: '2024-01-10'
}

for conference_id in range(1, 4):
    date = conference_dates[conference_id]
    for start_time, end_time in session_times:
        cursor.execute("""
            INSERT INTO conference_session (conference_id, start_time, end_time, date)
            VALUES (%s, %s, %s, %s)
        """, (conference_id, start_time, end_time, date))
conn.commit()

for session_id in range(1, 16):
    for topic_num in range(1, 11):
        title = f'Доклад {topic_num} сессии {session_id}'
        cursor.execute("INSERT INTO topic (title, session_id) VALUES (%s, %s)", (title, session_id))
conn.commit()

author_id = 1
for topic_id in range(1, 151):
    for _ in range(2):
        cursor.execute("INSERT INTO authorship (author_id, topic_id) VALUES (%s, %s)", (author_id, topic_id))
        author_id += 1
        if author_id > 1200:
            author_id = 1
conn.commit()

cursor.close()
conn.close()

print("Данные успешно сгенерированы и добавлены в базу данных.")
        