from utils.db import db
from . import gradient_models
from fastapi import HTTPException
from typing import Any
import base64

def get_all_gradients():
    try:
        if not db.is_connected():
            raise HTTPException(status_code=500, detail="Database not connected")
        cursor = db.cursor(dictionary=True)
        sql = "SELECT id, title, description, image FROM gradients"
        cursor.execute(sql)
        result = cursor.fetchall()
        if len(result) == 0:
            return []
        gradients = [
            {
                "id": row["id"],
                "title": row["title"],
                "description": row["description"],
                "image" : base64.b64encode(row["image"]).decode("utf-8")
            } for row in result
        ]
        return gradients
    except Exception as e:
        raise e

def get_gradient(id: int):
    try:
        if not db.is_connected():
            raise HTTPException(status_code=500, detail="Database is not connected")
        cursor = db.cursor(dictionary=True)
        sql = "SELECT id, title, description, image FROM gradients WHERE id = %s"
        values = (id,)
        cursor.execute(sql, values)
        result = cursor.fetchone()
        if result is None:
            raise HTTPException(status_code=404, detail="Gradient not found")
        image_bytes = result["image"]
        images_base64 = base64.b64encode(image_bytes).decode("utf-8")
        return {
            "id" : result["id"], 
            "title":result["title"], 
            "description": result["description"], 
            "image": images_base64
            }
    except Exception as e:
        raise e

def create_gradient(title:str, description:str, image : bytes):
    try:
        if not db.is_connected():
            raise HTTPException(status_code=500, detail="Database is not connected")
        cursor = db.cursor()
        sql = "INSERT INTO gradients (title, description, image) VALUES(%s, %s, %s)"
        values = (title, description, image)
        cursor.execute(sql, values)
        db.commit()
        if not cursor.lastrowid:
            raise HTTPException(status_code=500, detail="Gradient is not created")
        return cursor.lastrowid
    except Exception as e:
        if db:
            db.rollback()
        raise e
    finally:
        if cursor:
            cursor.close()

def update_gradient(id: int, title:str, description:str, image:bytes):
    try:
        if not db.is_connected():
            raise HTTPException(status_code=500, detail="Databaase is not connected")
        cursor = db.cursor()
        sql = "UPDATE gradients SET title = %s , description = %s , image = %s WHERE id = %s"
        values = (title, description, image, id)
        cursor.execute(sql, values)
        db.commit()
        if cursor.rowcount == 0:
            raise HTTPException(status_code=500, detail="Gradient is not updated")
        return cursor.rowcount
    except Exception as e:
        if db:
            db.rollback()
        raise e
    finally:
        if cursor:
            cursor.close()

def delete_gradient(id:int):
    try:
        if not db.is_connected():
            raise HTTPException(status_code=500, detail="Database is not connected")
        cursor = db.cursor()
        sql = "DELETE FROM gradients WHERE id = %s"
        values = (id,)
        cursor.execute(sql, values)
        db.commit()
        if cursor.rowcount == 0:
            raise HTTPException(status_code=500, detail="Gradient is not deleted")
        return cursor.rowcount
    except Exception as e:
        if db:
            db.rollback()
        raise e
    finally:
        if cursor:
            cursor.close()