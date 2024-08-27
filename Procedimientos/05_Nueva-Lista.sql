---------------------Procedimiento 5------------------------------------------------------------------------------
----------------------registrar  vista de una pelicula
CREATE OR ALTER PROCEDURE SP_nueva_lista
@fch_vista DATE , @id_vistas CHAR(4),@id_pelicula CHAR(5),@cod_cliente CHAR(6)
AS
BEGIN
-- Verifica que la película y el cliente existen
IF EXISTS (SELECT 1 FROM Peliculas WHERE id_pelicula = @id_pelicula)
    AND EXISTS (SELECT 1 FROM Cliente WHERE cod_cliente = @cod_cliente)
 BEGIN
-- Inserta una nueva fila en la tabla vistas
INSERT INTO Vistas (id_vistas, cod_cliente, id_pelicula, fch_vista)
VALUES (@id_vistas, @cod_cliente, @id_pelicula, @fch_vista);
END

ELSE
BEGIN
PRINT 'El id_pelicula o el cod_cliente no son válidos.';
END

END;
GO

EXECUTE SP_nueva_lista '2024-08-29', 'VT11', 'P0001', 'U00001';
GO