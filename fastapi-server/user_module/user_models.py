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

class GetAllUsersResponseModel(BaseModel):
    users: List[UserModel]