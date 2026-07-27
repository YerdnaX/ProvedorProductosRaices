from fastapi import APIRouter, HTTPException

from app.database import obtener_conexion
from app.schemas import ProductoProvedor

router = APIRouter(prefix="/api", tags=["disponibilidad"])


def convertir_producto(fila) -> ProductoProvedor:
    return ProductoProvedor(
        idProductoProvedor=fila["IdProductoProvedor"],
        nombreProducto=fila["NombreProducto"],
        categoria=fila["Categoria"],
        cantidadDisponible=fila["CantidadDisponible"],
        precioProveedor=float(fila["PrecioProveedor"]),
        tiempoReposicionDias=fila["TiempoReposicionDias"],
        estado=fila["Estado"],
        fechaActualizacion=fila["FechaActualizacion"],
    )


@router.get("/disponibilidad", response_model=list[ProductoProvedor])
def obtener_disponibilidad():
    with obtener_conexion() as conexion:
        cursor = conexion.cursor()
        cursor.execute(
            """
            SELECT
                IdProductoProvedor,
                NombreProducto,
                Categoria,
                CantidadDisponible,
                PrecioProveedor,
                TiempoReposicionDias,
                Estado,
                FechaActualizacion
            FROM ProvedorProductos_Productos
            ORDER BY NombreProducto
            """
        )
        return [convertir_producto(fila) for fila in cursor.fetchall()]


@router.get("/disponibilidad/{id_producto_provedor}", response_model=ProductoProvedor)
def obtener_disponibilidad_por_producto(id_producto_provedor: int):
    with obtener_conexion() as conexion:
        cursor = conexion.cursor()
        cursor.execute(
            """
            SELECT
                IdProductoProvedor,
                NombreProducto,
                Categoria,
                CantidadDisponible,
                PrecioProveedor,
                TiempoReposicionDias,
                Estado,
                FechaActualizacion
            FROM ProvedorProductos_Productos
            WHERE IdProductoProvedor = %s
            """,
            (id_producto_provedor,),
        )
        fila = cursor.fetchone()

    if fila is None:
        raise HTTPException(status_code=404, detail="Producto no encontrado en el provedor")

    return convertir_producto(fila)
