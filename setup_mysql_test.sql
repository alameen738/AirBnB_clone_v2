#!/usr/bin/python3

import mysql.connector

def prepare_mysql_server():
    try:
        # Connect to MySQL server (adjust parameters as needed)
        connection = mysql.connector.connect(
            host="localhost",
            user="root",  # assuming you have root access
            password="your_root_password"
        )

        # Create a cursor object to execute SQL queries
        cursor = connection.cursor()

        # Create database if it doesn't exist
        cursor.execute("CREATE DATABASE IF NOT EXISTS hbnb_test_db")

        # Create user if it doesn't exist
        cursor.execute("CREATE USER IF NOT EXISTS 'hbnb_test'@'localhost' IDENTIFIED BY 'hbnb_test_pwd'")

        # Grant privileges to the user
        cursor.execute("GRANT ALL PRIVILEGES ON hbnb_test_db.* TO 'hbnb_test'@'localhost'")
        cursor.execute("GRANT SELECT ON performance_schema.* TO 'hbnb_test'@'localhost'")

        # Commit the changes
        connection.commit()

        print("MySQL server prepared successfully.")

    except mysql.connector.Error as error:
        print("Error:", error)

    finally:
        if connection.is_connected():
            cursor.close()
            connection.close()

if __name__ == "__main__":
    prepare_mysql_server()
