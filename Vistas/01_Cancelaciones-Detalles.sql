--Vista 1
--vista de detalles de cancelaciones
CREATE  OR ALTER view  Vista_Cancelaciones_Detalles AS
SELECT
ca.nro_cancelacion AS 'Numero cancelacion',
ca.fecha_cancela  AS 'Fecha cancelacion',
ca.motivo_cancela  AS 'Motivo cancelacion',
c.nombre_cliente  AS 'Nombre Cliente',
ts.cod_tipo_suscripcion AS 'Codigo de Suscripcion',
f.tipo_Pag AS 'Tipo Pago'
FROM Cancelacion ca
JOIN Cliente c ON ca.cod_cliente = c.cod_cliente
JOIN Tipo_suscripcion ts ON ca.cod_tipo_suscripcion = ts.cod_tipo_suscripcion
JOIN FormaPago f ON ca.cod_form_pago = f.cod_form_pago;

GO
SELECT * FROM Vista_Cancelaciones_Detalles;
GO