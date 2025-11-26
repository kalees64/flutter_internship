from fastapi import HTTPException
from utils.db import db
from . import user_models


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
        query = "INSERT INTO users (name, email, age, password) VALUES (%s, %s, %s, %s)"
        values = (user.name, user.email, user.age, user.password)
        cursor.execute(query, values)
        db.commit()
        return {"message": "User created successfully", "user_id": cursor.lastrowid}
    except Exception as e:
        raise e
    finally:
        cursor.close()

def update_user_name_and_age(user_id: int, user: user_models.UpdateUserNameAndAgeModel):
    try:
        if not db.is_connected():
            raise HTTPException(status_code=500, detail="Database is not connected")
        cursor = db.cursor()
        query = "UPDATE users SET name = %s, age = %s WHERE id = %s"
        values = (user.name, user.age, user_id)
        cursor.execute(query, values)
        db.commit()
        return {"message": "User updated successfully", "affected_rows": cursor.rowcount}
    except Exception as e:
        raise e
    finally:
        cursor.close()

def delete_user(user_id: int):
    try:
        if not db.is_connected():
            raise HTTPException(status_code=500, detail="Database is not connected")
        cursor = db.cursor()
        query = "DELETE FROM users WHERE id = %s"
        values = (user_id,)
        cursor.execute(query, values)
        db.commit()
        return {"message": "User deleted successfully", "affected_rows": cursor.rowcount}
    except Exception as e:
        raise e
    finally:
        cursor.close()