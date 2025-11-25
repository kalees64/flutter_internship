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
