from fastapi import APIRouter
from starlette import status
from . import user_models, user_service
from fastapi import Depends
from guard.guard import verify_bearer_token

user_controller = APIRouter(tags=["User"], prefix="/api/v1/user" , dependencies=[Depends(verify_bearer_token)])

@user_controller.get("", status_code=status.HTTP_200_OK, response_model=user_models.GetAllUsersResponseModel)
def get_all_users():
    return user_service.get_all_users()

@user_controller.post("", status_code=status.HTTP_201_CREATED, response_model=user_models.CreateUserResponseModel)
def create_user(user: user_models.CreateUserModel):
    return user_service.create_user(user)

@user_controller.patch("/{user_id}", status_code=status.HTTP_200_OK, response_model=user_models.UpdateUserNameAndAgeResponseModel)
def update_user_name_and_age(user_id: int, user: user_models.UpdateUserNameAndAgeModel):
    return user_service.update_user_name_and_age(user_id, user)

@user_controller.delete("/{user_id}", status_code=status.HTTP_200_OK, response_model=user_models.DeleteUserResponseModel)
def delete_user(user_id: int):
    return user_service.delete_user(user_id)
