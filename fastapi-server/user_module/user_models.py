from pydantic import BaseModel
from typing import List

class UserModel(BaseModel):
    id: int
    name: str
    email: str
    age: int

class CreateUserModel(BaseModel):
    name: str
    email: str
    age: int

class UpdateUserNameAndAgeModel(BaseModel):
    name: str
    age: int

class GetAllUsersResponseModel(BaseModel):
    users: List[UserModel]

class CreateUserResponseModel(BaseModel):
    message: str
    user_id: int

class UpdateUserNameAndAgeResponseModel(BaseModel):
    message: str
    affected_rows: int

class DeleteUserResponseModel(BaseModel):
    message: str
    affected_rows: int
