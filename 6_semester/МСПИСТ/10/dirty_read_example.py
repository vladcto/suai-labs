import mysql.connector

def dirty_read_example():
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
        
        cursor1.execute("SET SESSION TRANSACTION ISOLATION LEVEL READ UNCOMMITTED")
        cursor2.execute("SET SESSION TRANSACTION ISOLATION LEVEL READ UNCOMMITTED")
        
        connection1.start_transaction()
        cursor1.execute("UPDATE student SET name='John Doe' WHERE id=1")
        
        cursor2.execute("SELECT name FROM student WHERE id=1")
        result = cursor2.fetchone()
        print(f"Грязное чтение: {result[0]}")
        
        connection1.rollback()
        
    finally:
        connection1.close()
        connection2.close()

if __name__ == "__main__":
    dirty_read_example()
