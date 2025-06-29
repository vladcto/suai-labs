import mysql.connector

def phantom_read_example():
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
        
        cursor1.execute("SET SESSION TRANSACTION ISOLATION LEVEL REPEATABLE READ")
        cursor2.execute("SET SESSION TRANSACTION ISOLATION LEVEL REPEATABLE READ")
        
        connection1.start_transaction()
        cursor1.execute("SELECT COUNT(*) FROM student WHERE group_id=1")
        result1 = cursor1.fetchone()
        print(f"Количество перед вставкой: {result1[0]}")
        
        connection2.start_transaction()
        cursor2.execute("INSERT INTO student (group_id, name) VALUES (1, 'New Phantom Student')")
        connection2.commit()
        
        cursor1.execute("SELECT COUNT(*) FROM student WHERE group_id=1")
        result2 = cursor1.fetchone()
        print(f"Количество после вставки: {result2[0]}")
        
        connection1.commit()
        
    finally:
        connection1.close()
        connection2.close()

if __name__ == "__main__":
    phantom_read_example()
