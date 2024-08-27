----------------------PROCEDIMIENTO 1

CREATE OR ALTER PROCEDURE SP_Categoria_pelicula @nombre_categ VARCHAR(15)
AS
BEGIN
IF EXISTS(  SELECT p.id_pelicula, p.titulo_peli
FROM Peliculas p
INNER JOIN Categorias c ON p.id_pelicula = c.id_pelicula
WHERE c.nombre_categ = @nombre_categ
)
SELECT p.id_pelicula, p.titulo_peli
FROM Peliculas p
INNER JOIN Categorias c ON p.id_pelicula = c.id_pelicula
WHERE c.nombre_categ = @nombre_categ;
END
ELSE
BEGIN
PRINT 'No hay peliculas registradas en la categoria'
END

EXECUTE SP_Categoria_pelicula'comedia'
GO