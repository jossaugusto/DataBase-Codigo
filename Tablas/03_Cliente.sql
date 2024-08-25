CREATE TABLE Cliente (
    cod_cliente CHAR(6) PRIMARY KEY NOT NULL,
    cod_contrasena CHAR(5) UNIQUE NOT NULL, 
    nombre_cliente VARCHAR(15) NOT NULL, 
    apellido_cliente VARCHAR(20) NOT NULL, 
    fch_nac DATE NOT NULL,
    fch_reg DATE DEFAULT GETDATE(),
    cod_pais CHAR(4) NOT NULL,
    email_cliente VARCHAR(35) UNIQUE NOT NULL,
	FOREIGN KEY (cod_pais) REFERENCES pais(cod_pais),
    FOREIGN KEY (cod_contrasena) REFERENCES Contrasenas(cod_contrasena)
)