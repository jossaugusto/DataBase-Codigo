CREATE TABLE Peliculas (
    id_pelicula CHAR(5) PRIMARY KEY NOT NULL , 
    id_clasificacion CHAR(4) UNIQUE,
    titulo_peli VARCHAR(50) NOT NULL,
    idioma_principal VARCHAR(15) NULL,
    pais_origen VARCHAR(20) NULL, 
    valoracion_peli VARCHAR(20) NOT NULL,
    fecha_estreno DATE NOT NULL,
)