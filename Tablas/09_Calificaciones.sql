CREATE TABLE Calificaciones (
  id_calificacion CHAR(3) PRIMARY KEY NOT NULL,
  id_pelicula CHAR(5) NOT NULL,
  cod_cliente CHAR(6) NOT NULL,
  fch_calif DATE ,
  calificacion VARCHAR(15),
  FOREIGN KEY (id_pelicula) REFERENCES Peliculas (id_pelicula),
  FOREIGN KEY (cod_cliente) REFERENCES Cliente (cod_cliente)
)