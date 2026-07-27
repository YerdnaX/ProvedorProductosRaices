USE tiusr15pl_ProvedoresRaicesBosque;
GO

MERGE ProvedorProductos_Productos AS destino
USING (
    VALUES
        (1, 'Maceta de barro mediana', 'Macetas', 80, 2100.00, 1, 'Disponible'),
        (2, 'Maceta decorativa blanca', 'Macetas', 42, 3200.00, 2, 'Disponible'),
        (3, 'Fertilizante organico', 'Fertilizantes', 70, 1900.00, 1, 'Disponible'),
        (4, 'Kit de jardineria basico', 'Herramientas', 12, 7200.00, 4, 'Pocas unidades')
) AS origen (
    IdProductoProvedor,
    NombreProducto,
    Categoria,
    CantidadDisponible,
    PrecioProveedor,
    TiempoReposicionDias,
    Estado
)
ON destino.IdProductoProvedor = origen.IdProductoProvedor
WHEN MATCHED THEN
    UPDATE SET
        NombreProducto = origen.NombreProducto,
        Categoria = origen.Categoria,
        CantidadDisponible = origen.CantidadDisponible,
        PrecioProveedor = origen.PrecioProveedor,
        TiempoReposicionDias = origen.TiempoReposicionDias,
        Estado = origen.Estado,
        FechaActualizacion = GETDATE()
WHEN NOT MATCHED THEN
    INSERT (
        IdProductoProvedor,
        NombreProducto,
        Categoria,
        CantidadDisponible,
        PrecioProveedor,
        TiempoReposicionDias,
        Estado
    )
    VALUES (
        origen.IdProductoProvedor,
        origen.NombreProducto,
        origen.Categoria,
        origen.CantidadDisponible,
        origen.PrecioProveedor,
        origen.TiempoReposicionDias,
        origen.Estado
    );
GO
