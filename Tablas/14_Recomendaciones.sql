CREATE TABLE Recomendaciones (
    id_recomendacion CHAR(4) PRIMARY KEY NOT NULL, 
    id_pelicula CHAR(5) NOT NULL, 
    cod_cliente CHAR(6) NOT NULL,
    id_vistas CHAR(4) NOT NULL,
    FOREIGN KEY (cod_cliente) REFERENCES Cliente(cod_cliente),
    FOREIGN KEY (id_pelicula) REFERENCES Peliculas(id_pelicula),
    FOREIGN KEY (id_vistas) REFERENCES Vistas(id_vistas)
)