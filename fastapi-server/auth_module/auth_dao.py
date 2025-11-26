from . import auth_models
from utils.db import db
from fastapi import HTTPException



def login(user: auth_models.LoginRequestModel):
    try:
        if not db.is_connected():
            raise HTTPException(status_code=500, detail="Database connection failed")
        cursor = db.cursor(dictionary=True)
        sql = "SELECT email, name FROM users WHERE email = %s AND password = %s"
        values = (user.email, user.password)
        cursor.execute(sql, values)
        result = cursor.fetchone()
        if not result:
            raise HTTPException(status_code=401, detail="Invalid email or password")
        return result
    except Exception as e:
        raise e
    finally:
        cursor.close()