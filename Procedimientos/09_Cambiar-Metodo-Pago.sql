--------------------------------------------------------------------procedimiento 9------------------------------------------------------------------------------------
----------------------------para cambiar el metodo de pago.--------------------

CREATE OR ALTER PROCEDURE SP_Cambiar_metodo_pago
(@cod_form_pago CHAR(3),@tipo_pag VARCHAR(20))
AS
BEGIN
UPDATE FormaPago
SET tipo_pag = @tipo_pag
WHERE cod_form_pago = @cod_form_pago;
END
GO

EXECUTE SP_Cambiar_metodo_pago '002','tarjeta'
GO