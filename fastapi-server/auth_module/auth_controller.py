from fastapi import APIRouter
from starlette import status
from . import auth_models, auth_service

auth_controller = APIRouter(tags=["Auth"], prefix="/api/v1/auth")

@auth_controller.post("/login", status_code=status.HTTP_200_OK, response_model=auth_models.LoginResponseModel)
def login(user: auth_models.LoginRequestModel):
    return auth_service.login(user)