--Procedimiento 8
--Cambiar la categoria de una pelicula existente
CREATE OR ALTER PROCEDURE SP_Cambiar_Categoria_Pelicula
(@id_categoria CHAR(5),@id_pelicula CHAR(5),@nombre_categ VARCHAR(15))
AS
BEGIN

UPDATE Categorias
SET nombre_categ = @nombre_categ
WHERE  id_categoria = @id_categoria AND id_pelicula = @id_pelicula;
END
GO

EXECUTE SP_Cambiar_CATEGORIA_PELICULA'C0001','P0001','romance'
GO