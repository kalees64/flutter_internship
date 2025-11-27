from fastapi import APIRouter, File, UploadFile, HTTPException
from starlette import status
from . import gradient_service, gradient_models

gradient_controller = APIRouter(tags=["Gradients"], prefix="/api/v1/gradients")

@gradient_controller.get("", status_code=status.HTTP_200_OK)
def get_all_gradients():
    return gradient_service.get_all_gradients()

@gradient_controller.get("/{id}", status_code=status.HTTP_200_OK)
def get_gradient(id: int):
    return gradient_service.get_gradient(id)

@gradient_controller.post("", status_code=status.HTTP_201_CREATED)
async def create_gradient(title:str = File(...), description:str = File(...), image:UploadFile = File(...)):
    image_bytes = await image.read()
    if not image_bytes:
        raise HTTPException(status_code=400, detail="Invalid image file")
    return gradient_service.create_gradient(title=title, description=description, image=image_bytes)

@gradient_controller.patch("/{id}", status_code=status.HTTP_200_OK)
async def update_gradient(id:int, title:str = File(...), description:str = File(...), image:UploadFile = File(...)):
    image_bytes = await image.read()
    if not image_bytes:
        raise HTTPException(status_code=400, detail="Invalid image file")
    return gradient_service.update_gradient(id=id, title=title, description=description, image=image_bytes)

@gradient_controller.delete("/{id}", status_code=status.HTTP_200_OK)
def delete_gradient(id: int):
    return gradient_service.delete_gradient(id)