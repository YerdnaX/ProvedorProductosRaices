# Guia de integracion con Render

Esta guia explica como publicar `Provedor Productos API` en Render como un Web Service.

## Requisitos

- Tener el repo del provedor subido a GitHub.
- Tener una cuenta en Render.
- Tener acceso a la base de datos SQL Server `tiusr15pl_ProvedoresRaicesBosque`.
- Haber ejecutado los scripts:

```txt
database/crear_tablas.sql
database/datos_prueba.sql
```

## Configuracion en Render

Crear un nuevo servicio:

```txt
New
Web Service
Build and deploy from a Git repository
```

Configurar:

```txt
Name: provedor-productos-raices
Environment: Python
Branch: master
Root Directory: dejar vacio
Build Command: pip install -r requirements.txt
Start Command: uvicorn app.main:app --host 0.0.0.0 --port $PORT
```

El repo incluye `runtime.txt` y `.python-version` con Python 3.12.8.

## Variables de entorno

Agregar estas variables en Render:

```txt
DB_USER=usuario_sql
DB_PASSWORD=password_sql
DB_SERVER=tiusr15pl.cuc-carrera-ti.ac.cr
DB_DATABASE=tiusr15pl_ProvedoresRaicesBosque
DB_PORT=1433
PYTHON_VERSION=3.12.8
```

No agregar:

```txt
DB_DRIVER
DB_ENCRYPT
DB_TRUST_CERT
```

Esta API usa `pymssql`, no `pyodbc`.

## Endpoints para probar

```bash
curl https://provedor-productos-raices.onrender.com/api/health
curl https://provedor-productos-raices.onrender.com/api/disponibilidad
curl https://provedor-productos-raices.onrender.com/api/disponibilidad/1
```

## Integracion con el backend principal

Cuando la API del provedor este publicada, actualizar el backend principal con:

```txt
PROVEDOR_PRODUCTOS_API_URL=https://provedor-productos-raices.onrender.com
```

No agregar una variable de timeout. El timeout queda fijo en el codigo del backend principal.
