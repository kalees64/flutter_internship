from fastapi import FastAPI
from user_module.user_controller import user_controller
from auth_module.auth_controller import auth_controller
from gradients_module.gradient_controller import gradient_controller


app = FastAPI(title="VK64 Flutter API", version="0.0.1")


app.include_router(auth_controller)
app.include_router(user_controller)
app.include_router(gradient_controller)

# if __name__ == "__main__":
#     run("main:app", host="127.0.0.1", port=3000, reload=True)