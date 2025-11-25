from fastapi import APIRouter
from starlette import status
from . import user_models, user_service

user_controller = APIRouter(tags=["User"], prefix="/api/v1/user" )

@user_controller.get("", status_code=status.HTTP_200_OK, response_model=user_models.GetAllUsersResponseModel)
def get_all_users():
    return user_service.get_all_users()

@user_controller.post("", status_code=status.HTTP_201_CREATED)
def create_user(user: user_models.CreateUserModel):
    return user_service.create_user(user)