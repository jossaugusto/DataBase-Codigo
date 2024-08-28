--Procedimiento 10
--Registrar una nueva factura de cliente

CREATE OR ALTER PROCEDURE SP_Registrar_Factura
( @nro_fact CHAR(6), @fech_fact DATE, @cod_tipo_suscripcion CHAR(3),@cod_form_pago CHAR(3), @cod_cliente CHAR(6))
AS
BEGIN
INSERT INTO  factura 
(nro_fact, fech_fact, cod_tipo_suscripcion, cod_form_pago, cod_cliente)
VALUES
(@nro_fact, @fech_fact, @cod_tipo_suscripcion, @cod_form_pago, @cod_cliente);
END
GO

EXECUTE SP_Registrar_Factura 'FAC013','2024-08-26','T02','001','U00002'
GO