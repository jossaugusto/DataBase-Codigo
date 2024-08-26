CREATE TABLE Categorias (
    id_categoria CHAR(5) NOT NULL, 
    id_pelicula CHAR(5) NOT NULL, 
    nombre_categ VARCHAR(15) NOT NULL,
    PRIMARY KEY (id_categoria, id_pelicula) 
    FOREIGN KEY (id_pelicula) REFERENCES Peliculas(id_pelicula)
)