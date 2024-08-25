CREATE TABLE Categorias (
    id_categoria CHAR(5) PRIMARY KEY NOT NULL, 
    id_pelicula CHAR(5) NOT NULL, 
    nombre_categ VARCHAR(15) NOT NULL,
    FOREIGN KEY (id_pelicula) REFERENCES Peliculas(id_pelicula)
)