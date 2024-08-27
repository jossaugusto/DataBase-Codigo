-----------------------------------------------------------------procedimiento 7----------------------------------------------------------------
------------------------eliminar un cliente ------------------------------------------

CREATE OR ALTER PROCEDURE SP_Borrar_CLi
(@cod_cliente CHAR(6))
AS
BEGIN
DELETE FROM recomendaciones WHERE cod_cliente = @cod_cliente;
DELETE FROM vistas WHERE cod_cliente = @cod_cliente;
DELETE FROM factura WHERE cod_cliente = @cod_cliente;
DELETE FROM cancelacion WHERE cod_cliente = @cod_cliente;
DELETE FROM tipo_suscripcion WHERE cod_cliente = @cod_cliente;
DELETE FROM calificaciones WHERE cod_cliente = @cod_cliente;
DELETE FROM reclamos WHERE cod_cliente = @cod_cliente;
DELETE FROM lista_pelicula WHERE cod_cliente = @cod_cliente;
DELETE FROM registro WHERE cod_cliente = @cod_cliente;
DELETE FROM cliente WHERE cod_cliente = @cod_cliente;
END
GO

EXECUTE  SP_Borrar_CLi 'U00017'
GO