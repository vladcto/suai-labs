import mysql.connector

def deadlock_example():
    connection1 = mysql.connector.connect(
        host='localhost',
        user='root',
        password='',
        database='conference_db_lab1'
    )

    connection2 = mysql.connector.connect(
        host='localhost',
        user='root',
        password='',
        database='conference_db_lab1'
    )

    try:
        cursor1 = connection1.cursor()
        cursor2 = connection2.cursor()

        connection1.start_transaction()
        cursor1.execute("UPDATE student SET name='Alice' WHERE id=1")
        
        connection2.start_transaction()
        cursor2.execute("UPDATE student SET name='Bob' WHERE id=2")

        try:
            cursor1.execute("UPDATE student SET name='Alice' WHERE id=2")
            connection1.commit()
        except mysql.connector.Error:
            connection1.rollback()

        try:
            cursor2.execute("UPDATE student SET name='Bob' WHERE id=1")
            connection2.commit()
        except mysql.connector.Error:
            connection2.rollback()

        report_cursor = connection1.cursor()
        report_cursor.execute("SHOW ENGINE INNODB STATUS")
        status = report_cursor.fetchone()[2]
        
        print("\nОтчет о последнем тупике:\n")
        print(status)

    except mysql.connector.Error as err:
        print(f"Общая ошибка: {err}")

    finally:
        connection1.close()
        connection2.close()

deadlock_example()
