import mysql.connector

def non_repeatable_read_example():
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
        
        cursor1.execute("SET SESSION TRANSACTION ISOLATION LEVEL READ COMMITTED")
        
        connection1.start_transaction()
        cursor1.execute("SELECT name FROM student WHERE id=1")
        result1 = cursor1.fetchone()
        print(f"Первое чтение: {result1[0]}")
        
        connection2.start_transaction()
        cursor2.execute("UPDATE student SET name='Jane Doe' WHERE id=1")
        connection2.commit()
        
        cursor1.execute("SELECT name FROM student WHERE id=1")
        result2 = cursor1.fetchone()
        print(f"Измененное чтение: {result2[0]}")
        
        connection1.commit()
        
    finally:
        connection1.close()
        connection2.close()

if __name__ == "__main__":
    non_repeatable_read_example()
