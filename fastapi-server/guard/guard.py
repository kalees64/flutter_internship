from fastapi.security import HTTPBearer,HTTPAuthorizationCredentials
from fastapi import HTTPException,Depends
from starlette import status
from typing import Annotated


bearer_auth = HTTPBearer()
SECRET_ACCESS_KEY = "vk64"

def verify_bearer_token(bearer_token:Annotated[HTTPAuthorizationCredentials,Depends(bearer_auth)]):
    if bearer_token.scheme == "Bearer" and bearer_token.credentials == SECRET_ACCESS_KEY:
        return {"token":bearer_token.credentials }
    raise HTTPException(status_code=status.HTTP_403_FORBIDDEN,detail="Invalid Bearer Token")
