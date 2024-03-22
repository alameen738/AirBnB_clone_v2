import mysql.connector

def create_database_and_user():
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
        cursor.execute("CREATE DATABASE IF NOT EXISTS hbnb_dev_db")

        # Create user if it doesn't exist
        cursor.execute("CREATE USER IF NOT EXISTS 'hbnb_dev'@'localhost' IDENTIFIED BY 'hbnb_dev_pwd'")

        # Grant privileges to the user
        cursor.execute("GRANT ALL PRIVILEGES ON hbnb_dev_db.* TO 'hbnb_dev'@'localhost'")
        cursor.execute("GRANT SELECT ON performance_schema.* TO 'hbnb_dev'@'localhost'")

        # Commit the changes
        connection.commit()

        print("MySQL server configured successfully.")

    except mysql.connector.Error as error:
        print("Error:", error)

    finally:
        if connection.is_connected():
            cursor.close()
            connection.close()

if __name__ == "__main__":
    create_database_and_user()
