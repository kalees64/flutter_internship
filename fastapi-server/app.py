from fastapi import FastAPI
from starlette import status
from pydantic import BaseModel
from user_module.user_controller import user_controller
from uvicorn import run

app = FastAPI(title="VK64 Flutter API", version="0.0.1")

class RootResponse(BaseModel):
    data: str

@app.get("/", status_code=status.HTTP_200_OK, response_model=RootResponse)
def root():
    return {"data" : "Welcome to Fast API buddy"}

app.include_router(user_controller)

# if __name__ == "__main__":
#     run("main:app", host="127.0.0.1", port=3000, reload=True)