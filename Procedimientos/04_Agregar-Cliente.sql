----PROCEDIMIENTO4-------------------------------------------------------------------------
--Procedimiento para agregar mas clientes-----------------------------------------------------

CREATE OR ALTER PROCEDURE SP_Agregar_Cliente
(@cod_cliente CHAR(6),@cod_contrasena CHAR(5),@nombre_cliente VARCHAR(15), @apellido_cliente VARCHAR(20), @fch_nac DATE,
@fch_reg DATE, @cod_pais CHAR(4),@email_cliente VARCHAR(35), @nom_pais VARCHAR(20))
  
AS
BEGIN
  
IF NOT EXISTS (SELECT 1 FROM pais WHERE cod_pais = @cod_pais)
BEGIN
  
    INSERT INTO Pais 
	(cod_pais, nom_pais)
    VALUES 
	(@cod_pais, @nom_pais);
END

IF NOT EXISTS (SELECT 1 FROM contrasenas WHERE cod_contrasena = @cod_contrasena)
BEGIN  
    INSERT INTO Contrasenas 
	(cod_contrasena, cod_cliente)
    VALUES 
	(@cod_contrasena, @cod_cliente);
END

INSERT INTO Cliente
(cod_cliente, cod_contrasena, nombre_cliente, apellido_cliente, fch_nac, fch_reg, cod_pais, email_cliente)
VALUES
(@cod_cliente, @cod_contrasena, @nombre_cliente, @apellido_cliente, @fch_nac, @fch_reg, @cod_pais, @email_cliente);
END
GO

EXECUTE SP_Agregar_Cliente 'U00019','A1252','Pepe',' Dominguez','2003-11-22','2024-10-12','0011','elhombreardaadda@gmail.com','bolivia'
GO