from fastapi import HTTPException
from . import user_dao, user_models


def get_all_users():
    try:
        users = user_dao.get_all_users()
        return {"users": users}
    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))

def create_user(user: user_models.CreateUserModel):
    try:
        return user_dao.create_user(user)
    except Exception as e:
        raise e

def update_user_name_and_age(user_id: int, user: user_models.UpdateUserNameAndAgeModel):
    try:
        return user_dao.update_user_name_and_age(user_id, user)
    except Exception as e:
        raise e

def delete_user(user_id: int):
    try:
        return user_dao.delete_user(user_id)
    except Exception as e:
        raise e

