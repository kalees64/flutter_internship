from pydantic import BaseModel
from typing import List

class UserModel(BaseModel):
    name: str
    email: str
    age: int

class GetAllUsersResponseModel(BaseModel):
    users: List[UserModel]