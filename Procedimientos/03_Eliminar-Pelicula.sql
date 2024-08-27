------Procedimiento 3-----------------------------------------------------------
--procedimiento para eliminar una pelicula repetida---------------------------------------------------------
CREATE OR ALTER PROCEDURE  SP_Eliminar_peli @id_pelicula CHAR(5)
AS
BEGIN
DELETE FROM Peliculas WHERE id_pelicula = @id_pelicula
DELETE FROM Categorias WHERE id_pelicula = @id_pelicula
END
GO

EXECUTE SP_Eliminar_peli 'P0017'
GO
