--vista 1
CREATE  OR ALTER VIEW Vista_Cancelaciones_Detalles AS
SELECT 
    ca.nro_cancelacion,
    ca.fecha_cancela,
    ca.motivo_cancela,
    c.nombre_usuario,
    ts.cod_tipo_suscripcion,
    f.tipo_Pag
FROM 
    Cancelacion ca
JOIN 
    Cliente c ON ca.cod_cliente = c.cod_cliente
JOIN 
    Tipo_suscripcion ts ON ca.cod_tipo_suscripcion = ts.cod_tipo_suscripcion
JOIN 
    FormaPago f ON ca.cod_form_pago = f.cod_form_pago;
go