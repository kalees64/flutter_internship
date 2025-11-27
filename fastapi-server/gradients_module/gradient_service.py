from . import gradient_dao, gradient_models
from typing import Any

def get_all_gradients():
    try:
        result = gradient_dao.get_all_gradients()
        return {"gradients":result}
    except Exception as e:
        raise e

def get_gradient(id: int):
    try:
        result = gradient_dao.get_gradient(id)
        return {"gradient" : result}
    except Exception as e:
        raise e

def create_gradient(title:str, description:str, image:bytes):
    try:
        result = gradient_dao.create_gradient(title=title, description=description, image=image)
        return {"message" : "Gradient created succsfully", "id": result}
    except Exception as e:
        raise e

def update_gradient(id:int, title:str, description:str, image:bytes):
    try:
        result = gradient_dao.update_gradient(id=id, title=title, description=description, image=image)
        return {"message": "Gradient updated successfully", "affected_rows" : result}
    except Exception as e:
        raise e

def delete_gradient(id:int):
    try:
        result = gradient_dao.delete_gradient(id=id)
        return {"message": "Gradient deleted successfully", "affected_rows" : result}
    except Exception as e:
        raise e