from datetime import datetime
from pydantic import BaseModel


class ProductoProvedor(BaseModel):
    idProductoProvedor: int
    nombreProducto: str
    categoria: str
    cantidadDisponible: int
    precioProveedor: float
    tiempoReposicionDias: int
    estado: str
    fechaActualizacion: datetime


class HealthResponse(BaseModel):
    success: bool
    message: str
