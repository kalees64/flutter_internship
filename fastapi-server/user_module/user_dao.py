from fastapi import HTTPException
import mysql.connector
from . import user_models

db = mysql.connector.connect(
    host = "localhost",
    user = "root",
    password = "",
    database = "flutter_intern"
)

def get_all_users():
    try:
        if not db.is_connected():
            raise HTTPException(status_code=500, detail="Database is not connected")
        cursor = db.cursor(dictionary=True)
        cursor.execute("SELECT id, name, email, age FROM users")
        result = cursor.fetchall()
        return result
    except Exception as e:
        raise e

def create_user(user: user_models.CreateUserModel):
    try:
        if not db.is_connected():
            raise HTTPException(status_code=500, detail="Database is not connected")
        cursor = db.cursor()
        query = "INSERT INTO users (name, email, age) VALUES (%s, %s, %s)"
        values = (user.name, user.email, user.age)
        cursor.execute(query, values)
        db.commit()
        return {"message": "User created successfully", "user_id": cursor.lastrowid}
    except Exception as e:
        raise e
    finally:
        cursor.close()