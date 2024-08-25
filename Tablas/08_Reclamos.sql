CREATE TABLE Reclamos (
    cod_reclamo CHAR(7) PRIMARY KEY NOT NULL,
    cod_cliente CHAR(6) NOT NULL, 
    fecha_reclamo DATE DEFAULT GETDATE(),
    detalle_reclamo VARCHAR(50) NOT NULL,
    FOREIGN KEY (cod_cliente) REFERENCES Cliente(cod_cliente)
)