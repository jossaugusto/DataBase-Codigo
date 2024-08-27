CREATE TABLE Cancelacion (
  nro_cancelacion CHAR(6) PRIMARY KEY NOT NULL,
  fecha_cancela DATE,
  motivo_cancela VARCHAR(50) NOT NULL,
  cod_cliente CHAR(6) NOT NULL,
  cod_tipo_suscripcion CHAR(3) NOT NULL,
  cod_form_pago CHAR(3) NOT NULL,
  FOREIGN KEY (cod_cliente) REFERENCES Cliente (cod_cliente),
  FOREIGN KEY (cod_tipo_suscripcion) REFERENCES Tipo_suscripcion (cod_tipo_suscripcion),
  FOREIGN KEY (cod_form_pago) REFERENCES FormaPago (cod_form_pago)
)