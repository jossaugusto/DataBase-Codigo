--PROCEDIMIENTO 6
--Calcular clientes que tienen un metodo de pago

CREATE OR ALTER PROCEDURE  SP_Conteo_cliente_metodo
AS
BEGIN
SELECT
fpa.tipo_pag AS TipoDePago,
COUNT(c.cod_cliente) AS Clientes
FROM FormaPago fpa
LEFT JOIN Factura f ON fpa.cod_form_pago = f.cod_form_pago
LEFT JOIN Cliente c ON f.cod_cliente = c.cod_cliente
LEFT JOIN Cancelacion ca ON fpa.cod_form_pago = ca.cod_form_pago AND c.cod_cliente = ca.cod_cliente
GROUP BY fpa.tipo_pag;
END
GO
	
EXECUTE SP_Conteo_cliente_metodo
GO