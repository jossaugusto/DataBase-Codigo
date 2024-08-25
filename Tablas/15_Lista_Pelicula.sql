CREATE TABLE Lista_pelicula (
    id_lista_pel CHAR(5) PRIMARY KEY NOT NULL,
    cod_cliente CHAR(6) NOT NULL, 
    id_pelicula CHAR(5) NOT NULL,
    FOREIGN KEY (cod_cliente) REFERENCES Cliente(cod_cliente),
    FOREIGN KEY (id_pelicula) REFERENCES Peliculas(id_pelicula)
)
go