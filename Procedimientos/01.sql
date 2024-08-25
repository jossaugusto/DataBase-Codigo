--procedimiento 1
CREATE PROCEDURE SP_Peliculas_Categoria (
    @nombre_categ VARCHAR(15)
)
AS
if exists(  SELECT p.id_pelicula, p.titulo_peli
    FROM Peliculas p
    INNER JOIN Categorias c ON p.id_pelicula = c.id_pelicula
    WHERE c.nombre_categ = @nombre_categ
 )
BEGIN

    SELECT p.id_pelicula, p.titulo_peli
    FROM Peliculas p
    INNER JOIN Categorias c ON p.id_pelicula = c.id_pelicula
    WHERE c.nombre_categ = @nombre_categ;
END
else
begin
print 'No hay peliculas registradas en la categoria'
end
execute SP_Peliculas_Categoria 'risa'
go