from . import auth_dao, auth_models

def login(user: auth_models.LoginRequestModel):
    try:
        result = auth_dao.login(user)
        return {"email": result["email"], "name": result["name"], "access_token": "vk64", "token_type": "bearer"}
    except Exception as e:
        raise e