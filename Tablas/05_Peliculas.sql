CREATE TABLE Peliculas (
  id_pelicula CHAR(5) PRIMARY KEY NOT NULL,
  titulo_peli VARCHAR(50) NOT NULL,
  idioma_principal VARCHAR(15),
  pais_origen CHAR(4),
  valoracion_peli VARCHAR(20) NOT NULL,
  fecha_estreno DATE NOT NULL,
  FOREIGN KEY (pais_origen) REFERENCES Pais (cod_pais)
)