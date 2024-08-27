CREATE TABLE Registro (
  nro_registro CHAR(6) PRIMARY KEY NOT NULL,
  cod_cliente CHAR(6) NOT NULL,
  cod_contrasena CHAR(5) NOT NULL,
  FOREIGN KEY (cod_cliente) REFERENCES Cliente (cod_cliente),
  FOREIGN KEY (cod_contrasena) REFERENCES Contrasenas (cod_contrasena)
)