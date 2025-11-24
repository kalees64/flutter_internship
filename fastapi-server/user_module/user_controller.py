from fastapi import APIRouter
from starlette import status
from . import user_models

user_controller = APIRouter(tags=["User"], prefix="/api/v1/user" )

@user_controller.get("", status_code=status.HTTP_200_OK, response_model=user_models.GetAllUsersResponseModel)
def get_all_users():
    return {"users" : []}