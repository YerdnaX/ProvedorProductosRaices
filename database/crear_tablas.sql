USE master;
GO

IF DB_ID('tiusr15pl_ProvedoresRaicesBosque') IS NULL
BEGIN
    CREATE DATABASE tiusr15pl_ProvedoresRaicesBosque;
END;
GO

USE tiusr15pl_ProvedoresRaicesBosque;
GO

IF OBJECT_ID('ProvedorProductos_Productos', 'U') IS NULL
BEGIN
    CREATE TABLE ProvedorProductos_Productos (
        IdProductoProvedor   INT NOT NULL PRIMARY KEY,
        NombreProducto       VARCHAR(150) NOT NULL,
        Categoria            VARCHAR(100) NOT NULL,
        CantidadDisponible   INT NOT NULL,
        PrecioProveedor      DECIMAL(10,2) NOT NULL,
        TiempoReposicionDias INT NOT NULL,
        Estado               VARCHAR(50) NOT NULL,
        FechaActualizacion   DATETIME NOT NULL DEFAULT GETDATE()
    );
END;
GO
