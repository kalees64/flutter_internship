from pydantic import BaseModel

class LoginResponseModel(BaseModel):
    name: str
    email: str
    access_token: str
    token_type: str

class LoginRequestModel(BaseModel):
    email: str
    password: str