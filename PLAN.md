# Plan - Provedor Productos API

## Objetivo

Crear una API fake en Python con FastAPI que simule un socio comercial para productos del vivero que no son plantas.

Este provedor queda separado de `provedor-vivero`:

- `provedor-vivero`: plantas, `TipoProducto = 'Planta'`.
- `provedor-productos`: macetas, fertilizantes, herramientas y otros productos con `TipoProducto = 'ProductoVivero'`.

La app movil no consume esta API directamente. El backend principal consulta esta API y agrega la informacion en el detalle del producto cuando corresponde.

## Tecnologia

- Python.
- FastAPI.
- Uvicorn.
- SQL Server.
- `pymssql`.
- Variables de entorno para conexion.

No usar `pyodbc`.
No usar `DB_DRIVER`.
No usar `DB_ENCRYPT`.
No usar `DB_TRUST_CERT`.

## Base de datos

Base:

```txt
tiusr15pl_ProvedoresRaicesBosque
```

Tabla:

```txt
ProvedorProductos_Productos
```

La tabla `Productos` del backend principal debe usar:

```txt
Productos.IdProductoProvedorProductos
```

No asumir que `Productos.IdProducto` coincide con `IdProductoProvedor`.

## Endpoints

Base local:

```txt
http://localhost:8002
```

Endpoints:

```txt
GET /api/health
GET /api/disponibilidad
GET /api/disponibilidad/{idProductoProvedor}
```

## Integracion con backend principal

Variable:

```txt
PROVEDOR_PRODUCTOS_API_URL=http://localhost:8002
```

Timeout fijo en codigo:

```txt
5000 ms
```
