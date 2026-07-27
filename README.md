# Provedor Productos API

API fake en Python con FastAPI para simular la disponibilidad externa de productos del vivero que no son plantas.

Este provedor cubre productos con `TipoProducto = 'ProductoVivero'`, por ejemplo macetas, fertilizantes y herramientas.

## Instalacion

```bash
python -m venv .venv
.venv\Scripts\activate
pip install -r requirements.txt
```

Copiar `.env.example` a `.env` y completar las credenciales reales de SQL Server.

Esta API usa `pymssql`, por lo que no necesita configurar `DB_DRIVER` ni instalar un driver ODBC en Windows.

## Base de datos

La base de datos usada por los provedores es:

```txt
tiusr15pl_ProvedoresRaicesBosque
```

Ejecutar primero:

```txt
database/crear_tablas.sql
database/datos_prueba.sql
```

## Ejecutar

```bash
uvicorn app.main:app --host 0.0.0.0 --port 8002 --reload
```

## Pruebas

```bash
curl http://localhost:8002/api/health
curl http://localhost:8002/api/disponibilidad
curl http://localhost:8002/api/disponibilidad/1
curl http://localhost:8002/api/disponibilidad/999
```
