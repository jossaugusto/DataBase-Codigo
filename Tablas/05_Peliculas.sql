CREATE TABLE Peliculas (
    id_pelicula CHAR(5) PRIMARY KEY NOT NULL , 
    id_categoria CHAR(5) NOT NULL,
    titulo_peli VARCHAR(50) NOT NULL,
    idioma_principal VARCHAR(15) NULL,
    pais_origen VARCHAR(20) NULL, 
    valoracion_peli VARCHAR(20) NOT NULL,
    fecha_estreno DATE NOT NULL,
    FOREIGN KEY (id_categoria) REFERENCES Categorias
)