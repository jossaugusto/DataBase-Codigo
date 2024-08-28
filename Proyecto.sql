CREATE TABLE Contrasenas (
  cod_contrasena CHAR(5) PRIMARY KEY NOT NULL,
  cod_cliente CHAR(6) NOT NULL
)

CREATE TABLE Pais (
  cod_pais CHAR(4) PRIMARY KEY NOT NULL,
  nom_pais VARCHAR(20) NOT NULL
)

CREATE TABLE Cliente (
  cod_cliente CHAR(6) PRIMARY KEY NOT NULL,
  cod_contrasena CHAR(5) UNIQUE NOT NULL,
  nombre_cliente VARCHAR(15) NOT NULL,
  apellido_cliente VARCHAR(20) NOT NULL,
  fch_nac DATE NOT NULL,
  fch_reg DATE,
  cod_pais CHAR(4) NOT NULL,
  email_cliente VARCHAR(35) UNIQUE NOT NULL,
  FOREIGN KEY (cod_pais) REFERENCES Pais (cod_pais),
  FOREIGN KEY (cod_contrasena) REFERENCES Contrasenas (cod_contrasena)
)

CREATE TABLE FormaPago (
  cod_form_pago CHAR(3) PRIMARY KEY NOT NULL,
  tipo_pag VARCHAR(20) NOT NULL
)

CREATE TABLE Peliculas (
  id_pelicula CHAR(5) PRIMARY KEY NOT NULL,
  titulo_peli VARCHAR(50) NOT NULL,
  idioma_principal VARCHAR(15),
  pais_origen CHAR(4),
  valoracion_peli VARCHAR(20) NOT NULL,
  fecha_estreno DATE NOT NULL,
  FOREIGN KEY (pais_origen) REFERENCES Pais (cod_pais)
)

CREATE TABLE Registro (
  nro_registro CHAR(6) PRIMARY KEY NOT NULL,
  cod_cliente CHAR(6) NOT NULL,
  cod_contrasena CHAR(5) NOT NULL,
  FOREIGN KEY (cod_cliente) REFERENCES Cliente (cod_cliente),
  FOREIGN KEY (cod_contrasena) REFERENCES Contrasenas (cod_contrasena)
)

CREATE TABLE Categorias (
  id_categoria CHAR(5) NOT NULL,
  id_pelicula CHAR(5) NOT NULL,
  nombre_categ VARCHAR(15) NOT NULL,
  PRIMARY KEY (id_categoria, id_pelicula),
  FOREIGN KEY (id_pelicula) REFERENCES Peliculas (id_pelicula)
)

CREATE TABLE Reclamos (
  cod_reclamo CHAR(7) PRIMARY KEY NOT NULL,
  cod_cliente CHAR(6) NOT NULL,
  fecha_reclamo DATE,
  detalle_reclamo VARCHAR(50) NOT NULL,
  FOREIGN KEY (cod_cliente) REFERENCES Cliente (cod_cliente)
)

CREATE TABLE Calificaciones (
  id_calificacion CHAR(3) PRIMARY KEY NOT NULL,
  id_pelicula CHAR(5) NOT NULL,
  cod_cliente CHAR(6) NOT NULL,
  fch_calif DATE ,
  calificacion VARCHAR(15),
  FOREIGN KEY (id_pelicula) REFERENCES Peliculas (id_pelicula),
  FOREIGN KEY (cod_cliente) REFERENCES Cliente (cod_cliente)
)

CREATE TABLE Tipo_suscripcion (
  cod_tipo_suscripcion CHAR(3) PRIMARY KEY NOT NULL,
  cod_cliente CHAR(6) NOT NULL,
  id_pelicula CHAR(5) NOT NULL,
  FOREIGN KEY (cod_cliente) REFERENCES Cliente (cod_cliente),
  FOREIGN KEY (id_pelicula) REFERENCES Peliculas (id_pelicula)
)

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

CREATE TABLE Factura (
  nro_fact CHAR(6) PRIMARY KEY NOT NULL,
  fech_fact DATE,
  cod_tipo_suscripcion CHAR(3) NOT NULL,
  cod_form_pago CHAR(3) NOT NULL,
  cod_cliente CHAR(6) NOT NULL,
  FOREIGN KEY (cod_cliente) REFERENCES Cliente (cod_cliente),
  FOREIGN KEY (cod_tipo_suscripcion) REFERENCES Tipo_suscripcion (cod_tipo_suscripcion),
  FOREIGN KEY (cod_form_pago) REFERENCES FormaPago (cod_form_pago)
)

CREATE TABLE Vistas (
  id_vistas CHAR(4) PRIMARY KEY NOT NULL,
  cod_cliente CHAR(6) NOT NULL,
  id_pelicula CHAR(5) NOT NULL,
  fch_vista DATE,
  FOREIGN KEY (cod_cliente) REFERENCES Cliente (cod_cliente),
  FOREIGN KEY (id_pelicula) REFERENCES Peliculas (id_pelicula)
)

CREATE TABLE Recomendaciones (
  id_recomendacion CHAR(4) PRIMARY KEY NOT NULL,
  id_pelicula CHAR(5) NOT NULL,
  cod_cliente CHAR(6) NOT NULL,
  id_vistas CHAR(4) NOT NULL,
  FOREIGN KEY (cod_cliente) references Cliente (cod_cliente),
  FOREIGN KEY (id_pelicula) references Peliculas (id_pelicula),
  FOREIGN KEY (id_vistas) references Vistas (id_vistas)
)

CREATE TABLE Lista_pelicula (
  id_lista_pel CHAR(5) PRIMARY KEY NOT NULL,
  cod_cliente CHAR(6) NOT NULL,
  id_pelicula CHAR(5) NOT NULL,
  FOREIGN KEY (cod_cliente) REFERENCES Cliente (cod_cliente),
  FOREIGN KEY (id_pelicula) REFERENCES Peliculas (id_pelicula)
)
GO

SELECT * FROM Contrasenas
INSERT INTO Contrasenas VALUES('A1234','U00001')
INSERT INTO Contrasenas VALUES('A1235','U00002')
INSERT INTO Contrasenas VALUES('A1236','U00003')
INSERT INTO Contrasenas VALUES('A1237','U00004')
INSERT INTO Contrasenas VALUES('A1238','U00005')
INSERT INTO Contrasenas VALUES('A1239','U00006')
INSERT INTO Contrasenas VALUES('A1240','U00007')
INSERT INTO Contrasenas VALUES('A1241','U00008')
INSERT INTO Contrasenas VALUES('A1242','U00009')
INSERT INTO Contrasenas VALUES('A1243','U00010')
INSERT INTO Contrasenas VALUES('A1244','U00011')
INSERT INTO Contrasenas VALUES('A1245','U00012')
INSERT INTO Contrasenas VALUES('A1246','U00013')
INSERT INTO Contrasenas VALUES('A1247','U00014')
INSERT INTO Contrasenas VALUES('A1248','U00015')
GO

SELECT * FROM pais
INSERT INTO pais VALUES ('0001','Peru')
INSERT INTO pais VALUES ('0002','Argentina')
INSERT INTO pais VALUES ('0003','Brasil')
INSERT INTO pais VALUES ('0004','España')
INSERT INTO pais VALUES ('0005','Estados Unidos')
INSERT INTO pais VALUES ('0006','Uruguay')
INSERT INTO pais VALUES ('0007','Mexico')
INSERT INTO pais VALUES ('0008','Canada')
INSERT INTO pais VALUES ('0009','Colombia')
INSERT INTO pais VALUES ('0010','Alemania')
GO

SELECT * FROM Cliente 
INSERT INTO Cliente VALUES('U00001','A1234','Pedro Pablo','Torres Rengifo','2001-06-23','2024-08-24','0005','pedropablo@gmail.com')
INSERT INTO Cliente VALUES ('U00002','A1235','Matias Jair','Perez Guimaraes','2003-03-11','2024-03-21','0004','matiasperez@gmail.com') 
INSERT INTO Cliente VALUES ('U00003','A1236','Maria Mercedes','Becerra Gonzales','1996-10-25','2016-03-21','0003','maria1996@gmail.com')
INSERT INTO Cliente VALUES ('U00004','A1237','Byron David ','Lopez Aliaga','2002-12-24','2021-05-12','0007','davidlopez@gmail.com')
INSERT INTO Cliente VALUES ('U00005','A1238','Carlos Daniel','Novillo Jara','1993-12-05','2023-12-01','0001','carlosmessi@gmail.com')
INSERT INTO Cliente VALUES ('U00006','A1239','Cristiano Jose','Ronaldo Aveiro','1991-05-17','2024-02-10','0010','cristiano07@gmail.com')
INSERT INTO Cliente VALUES ('U00007','A1240','Jaime Vicente','Martinez Cespedes','1999-05-12','2019-08-29','0001','jaimeelpro@gmail.com')
INSERT INTO Cliente VALUES ('U00008','A1241','Teodoro Ivan','De Sousa Ruiz','2001-05-29','2024-03-12','0009','teodororuiz@gmail.com')
INSERT INTO Cliente VALUES ('U00009','A1242','Jessica Rosa','Lainez Landi','2002-02-23','2023-10-01','0005','rositalainez23@gmail.com')
INSERT INTO Cliente VALUES ('U00010','A1243','Monica Cristina','Arias Santos','2003-12-20','2024-12-24','0002','monica2003arias@gmail.com')
INSERT INTO Cliente VALUES ('U00011','A1244','Patricia','Rosales Jaramillo','2001-10-21','2023-11-29','0002','patriciabarbie@gmail.com')
INSERT INTO Cliente VALUES ('U00012','A1245','Edwin Arturo','Soto Suarez','2001-11-30','2021-12-24','0001','edwinsosu@gmail.com')
INSERT INTO Cliente VALUES ('U00013','A1246','Lionel Andres','Messi Cuccitini','2001-10-24','2024-11-20','0002','lionelmessi@gmail.com')
INSERT INTO Cliente VALUES ('U00014','A1247','Ariana','Rodriguez Camargo','2001-11-24','2024-12-18','0004','ariana1124@gmail.com')
INSERT INTO Cliente VALUES ('U00015','A1248','Peter Adrian','Parker Dominguez','2003-11-21','2024-10-12','0005','elhombrearaña@gmail.com')
GO

SELECT * FROM FormaPago
INSERT INTO FormaPago VALUES('001','tarjeta')
INSERT INTO FormaPago VALUES('002','efectivo')
INSERT INTO FormaPago VALUES('003','paypal')
INSERT INTO FormaPago VALUES('004','pago efectivo')
GO

SELECT * FROM Peliculas
INSERT INTO Peliculas VALUES('P0001','El vengador','Ingles','0003','5estrellas','2010-10-14')
INSERT INTO Peliculas VALUES('P0002','Depredador','Ingles','0006','5 estrellas','1987-12-24')
INSERT INTO Peliculas VALUES('P0003','John Wick','Ingles','0001','5 estrellas','2014-12-25')
INSERT INTO Peliculas VALUES('P0004','El Conjuro','Ingles','0009','4.5 estrellas','2013-08-13')
INSERT INTO Peliculas VALUES('P0005','El Exorcista','Ingles','0005','4 estrellas','2015-07-22')
INSERT INTO Peliculas VALUES('P0006','Juego del Miedo','Ingles','0006','5 estrellas','2004-10-29')
INSERT INTO Peliculas VALUES('P0007','Supercool','Ingles','0007','5 estrellas','2007-10-13')
INSERT INTO Peliculas VALUES('P0008','Que paso ayer','Ingles','0010','5 estrellas','2009-02-18')
INSERT INTO Peliculas VALUES('P0009','Sherk','Ingles','0009','5 estrellas','2001-08-24')
INSERT INTO Peliculas VALUES('P0010','Muertos de risa','Ingles','0002','5 estrellas','2004-12-10')
GO

SELECT * FROM Registro
INSERT INTO Registro VALUES ('N00001','U00001','A1234')
INSERT INTO Registro VALUES ('N00002','U00002','A1235')
INSERT INTO Registro VALUES ('N00003','U00003','A1236')
INSERT INTO Registro VALUES ('N00004','U00004','A1237')
INSERT INTO Registro VALUES ('N00005','U00005','A1238')
INSERT INTO Registro VALUES ('N00006','U00006','A1239')
INSERT INTO Registro VALUES ('N00007','U00007','A1240')
INSERT INTO Registro VALUES ('N00008','U00008','A1241')
INSERT INTO Registro VALUES ('N00009','U00009','A1242')
INSERT INTO Registro VALUES ('N00010','U00010','A1243')
GO

SELECT * FROM Categorias
INSERT INTO Categorias VALUES('C0001','P0001','Accion')
INSERT INTO Categorias VALUES('C0001','P0002','Accion')
INSERT INTO Categorias VALUES('C0001','P0003','Accion')
INSERT INTO Categorias VALUES('C0002','P0004','Terror')
INSERT INTO Categorias VALUES('C0002','P0005','Terror')
INSERT INTO Categorias VALUES('C0002','P0006','Terror')
INSERT INTO Categorias VALUES('C0003','P0007','Comedia')
INSERT INTO Categorias VALUES('C0003','P0008','Comedia')
INSERT INTO Categorias VALUES('C0003','P0009','Comedia')
INSERT INTO Categorias VALUES('C0003','P0010','Comedia')
GO

SELECT * FROM Reclamos
INSERT INTO Reclamos VALUES('RCL0001', 'U00001', '2024-08-01', 'Problema con la calidad de video')
INSERT INTO Reclamos VALUES('RCL0002', 'U00002', '2024-04-02', 'Cobro duplicado en la factura')
INSERT INTO Reclamos VALUES('RCL0003', 'U00003', '2024-05-03', 'Problemas al iniciar sesión')
INSERT INTO Reclamos VALUES('RCL0004', 'U00004', '2024-05-04', 'Error en subtítulos')
INSERT INTO Reclamos VALUES('RCL0005', 'U00005', '2024-02-05', 'No se puede descargar película')
INSERT INTO Reclamos VALUES('RCL0006', 'U00006', '2024-03-06', 'Película no disponible')
INSERT INTO Reclamos VALUES('RCL0007', 'U00007', '2024-12-07', 'Problema con la aplicación móvil')
INSERT INTO Reclamos VALUES('RCL0008', 'U00008', '2024-11-08', 'Película no reproduce')
INSERT INTO Reclamos VALUES('RCL0009', 'U00009', '2024-10-09', 'Problemas de sincronización de audio')
INSERT INTO Reclamos VALUES('RCL0010', 'U00010', '2024-01-10', 'Error de facturación')
GO

SELECT * FROM Calificaciones
INSERT INTO Calificaciones VALUES('C01', 'P0001', 'U00001', '2024-08-01', 'Excelente')
INSERT INTO Calificaciones VALUES('C02', 'P0002', 'U00002', '2024-08-02', 'Buena')
INSERT INTO Calificaciones VALUES('C03', 'P0003', 'U00003', '2024-08-03', 'Regular')
INSERT INTO Calificaciones VALUES('C04', 'P0004', 'U00004', '2024-08-04', 'Mala')
INSERT INTO Calificaciones VALUES('C05', 'P0005', 'U00005', '2024-08-05', 'Excelente')
INSERT INTO Calificaciones VALUES('C06', 'P0006', 'U00006', '2024-08-06', 'Buena')
INSERT INTO Calificaciones VALUES('C07', 'P0007', 'U00007', '2024-08-07', 'Regular')
INSERT INTO Calificaciones VALUES('C08', 'P0008', 'U00008', '2024-08-08', 'Mala')
INSERT INTO Calificaciones VALUES('C09', 'P0009', 'U00009', '2024-08-09', 'Excelente')
INSERT INTO Calificaciones VALUES('C10', 'P0010', 'U00010', '2024-08-10', 'Buena')
GO

SELECT * FROM Tipo_suscripcion
INSERT INTO Tipo_suscripcion VALUES('T01', 'U00001', 'P0001')
INSERT INTO Tipo_suscripcion VALUES('T02', 'U00002', 'P0002')
INSERT INTO Tipo_suscripcion VALUES('T03', 'U00003', 'P0003')
INSERT INTO Tipo_suscripcion VALUES('T04', 'U00004', 'P0004')
INSERT INTO Tipo_suscripcion VALUES('T05', 'U00005', 'P0005')
INSERT INTO Tipo_suscripcion VALUES('T06', 'U00006', 'P0006')
INSERT INTO Tipo_suscripcion VALUES('T07', 'U00007', 'P0007')
INSERT INTO Tipo_suscripcion VALUES('T08', 'U00008', 'P0008')
INSERT INTO Tipo_suscripcion VALUES('T09', 'U00009', 'P0009')
INSERT INTO Tipo_suscripcion VALUES('T10', 'U00010', 'P0010')
GO

SELECT * FROM Cancelacion
INSERT INTO Cancelacion  VALUES('CNC001', '2024-08-11', 'No usa el servicio', 'U00001', 'T01', '001')
INSERT INTO Cancelacion  VALUES('CNC002', '2023-10-21', 'Servicio caro', 'U00002', 'T02', '002')
INSERT INTO Cancelacion  VALUES('CNC003', '2021-12-30', 'Mala calidad', 'U00003', 'T03', '003')
INSERT INTO Cancelacion  VALUES('CNC004', '2018-03-21', 'No satisface necesidades', 'U00004', 'T04', '001')
INSERT INTO Cancelacion  VALUES('CNC005', '2017-11-11', 'Falta de tiempo', 'U00005', 'T05', '002')
INSERT INTO Cancelacion  VALUES('CNC006', '2022-10-26', 'Problemas técnicos', 'U00006', 'T06', '001')
INSERT INTO Cancelacion  VALUES('CNC007', '2021-02-27', 'Cambió de servicio', 'U00007', 'T07', '003')
INSERT INTO Cancelacion  VALUES('CNC008', '2023-12-24', 'No funciona en su región', 'U00008', 'T08', '002')
INSERT INTO Cancelacion  VALUES('CNC009', '2020-01-01', 'Desinteresado en el servicio', 'U00009', 'T09', '003')
INSERT INTO Cancelacion  VALUES('CNC010', '2021-03-19', 'No se actualiza', 'U00010', 'T10', '001')
GO

SELECT * FROM Factura
INSERT INTO Factura VALUES('FAC001', '2024-07-10', 'T01', '001', 'U00001')
INSERT INTO Factura VALUES('FAC002', '2023-10-29', 'T02', '001', 'U00002')
INSERT INTO Factura VALUES('FAC003', '2022-02-03', 'T03', '003', 'U00003')
INSERT INTO Factura VALUES('FAC004', '2024-05-14', 'T04', '001', 'U00004')
INSERT INTO Factura VALUES('FAC005', '2024-01-15', 'T05', '002', 'U00005')
INSERT INTO Factura VALUES('FAC006', '2019-07-19', 'T06', '003', 'U00006')
INSERT INTO Factura VALUES('FAC007', '2017-08-21', 'T07', '001', 'U00007')
INSERT INTO Factura VALUES('FAC008', '2022-12-18', 'T08', '002', 'U00008')
INSERT INTO Factura VALUES('FAC009', '2020-11-28', 'T09', '003', 'U00009')
INSERT INTO Factura VALUES('FAC010', '2021-10-30', 'T10', '001', 'U00010')
GO

SELECT * FROM Vistas
INSERT INTO Vistas VALUES('VST1', 'U00001', 'P0001', '2024-08-01')
INSERT INTO Vistas VALUES('VST2', 'U00002', 'P0002', '2024-03-02')
INSERT INTO Vistas VALUES('VST3', 'U00003', 'P0003', '2024-02-10')
INSERT INTO Vistas VALUES('VST4', 'U00004', 'P0004', '2024-05-29')
INSERT INTO Vistas VALUES('VST5', 'U00005', 'P0005', '2024-10-15')
INSERT INTO Vistas VALUES('VST6', 'U00006', 'P0006', '2024-12-04')
INSERT INTO Vistas VALUES('VST7', 'U00007', 'P0007', '2024-01-19')
INSERT INTO Vistas VALUES('VST8', 'U00008', 'P0008', '2024-12-25')
INSERT INTO Vistas VALUES('VST9', 'U00009', 'P0009', '2024-03-30')
INSERT INTO Vistas VALUES('VT10','U00010', 'P0010', '2024-02-14')
GO

SELECT * FROM Recomendaciones
INSERT INTO Recomendaciones VALUES('REC1', 'P0001', 'U00001', 'VST1')
INSERT INTO Recomendaciones VALUES('REC2', 'P0002', 'U00002', 'VST2')
INSERT INTO Recomendaciones VALUES('REC3', 'P0003', 'U00003', 'VST3')
INSERT INTO Recomendaciones VALUES('REC4', 'P0004', 'U00004', 'VST4')
INSERT INTO Recomendaciones VALUES('REC5', 'P0005', 'U00005', 'VST5')
INSERT INTO Recomendaciones VALUES('REC6', 'P0006', 'U00006', 'VST6')
INSERT INTO Recomendaciones VALUES('REC7', 'P0007', 'U00007', 'VST7')
INSERT INTO Recomendaciones VALUES('REC8', 'P0008', 'U00008', 'VST8')
INSERT INTO Recomendaciones VALUES('REC9', 'P0009', 'U00009', 'VST9')
INSERT INTO Recomendaciones VALUES('RE10', 'P0010', 'U00010', 'VT10')
GO

SELECT * FROM Lista_pelicula
INSERT INTO Lista_pelicula VALUES('LST01', 'U00001', 'P0001')
INSERT INTO Lista_pelicula VALUES('LST02', 'U00002', 'P0002')
INSERT INTO Lista_pelicula VALUES('LST03', 'U00003', 'P0003')
INSERT INTO Lista_pelicula VALUES('LST04', 'U00004', 'P0004')
INSERT INTO Lista_pelicula VALUES('LST05', 'U00005', 'P0005')
INSERT INTO Lista_pelicula VALUES('LST06', 'U00006', 'P0006')
INSERT INTO Lista_pelicula VALUES('LST07', 'U00007', 'P0007')
INSERT INTO Lista_pelicula VALUES('LST08', 'U00008', 'P0008')
INSERT INTO Lista_pelicula VALUES('LST09', 'U00009', 'P0009')
INSERT INTO Lista_pelicula VALUES('LST10', 'U00010', 'P0010')
GO



--Vista 1
--vista para ver los detalles de cancelacion
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

--vista2------------
--Peliculas vistas por cliente
Create  OR ALTER view peliculas_por_cliente AS
SELECT
c.cod_cliente AS 'Cliente',
c.nombre_cliente AS 'Nombre',
c.apellido_cliente AS'Apellidos',
p.id_pelicula AS 'Pelicula',
p.titulo_peli AS 'Titulo Pelicula',
p.fecha_estreno AS 'Estreno'
FROM cliente c
JOIN Vistas v ON c.cod_cliente = v.cod_cliente
JOIN Peliculas p ON v.id_pelicula = p.id_pelicula;
GO

SELECT * FROM peliculas_por_cliente
GO

-------vista3------
--Ver valoraciones de las peliculas
CREATE OR ALTER  view peliculas_valoraciones AS
SELECT
p.titulo_peli, p.valoracion_peli,
c.nombre_categ AS 'Categoria',
COUNT(cal.id_calificacion) AS 'Numero_Calificaciones'
FROM peliculas p
LEFT JOIN calificaciones cal ON p.id_pelicula = cal.id_pelicula
LEFT JOIN categorias c ON p.id_pelicula = c.id_pelicula
GROUP BY p.titulo_peli, p.valoracion_peli, c.nombre_categ;
GO

SELECT * FROM peliculas_valoraciones
GO

--vista 4
--Ver vistas totales de cada pelicula
CREATE OR ALTER view Vistas_Totales AS
SELECT 
cat.nombre_categ AS categoría,
p.titulo_peli AS película,
COUNT(v.id_vistas) AS vizualizaciones_totales
FROM peliculas p
JOIN categorias cat ON p.id_pelicula = cat.id_pelicula
JOIN vistas v ON p.id_pelicula = v.id_pelicula
GROUP BY cat.nombre_categ, p.titulo_peli;
GO

SELECT * FROM Vistas_Totales
GO

--vista 5 
--Ver su pais de origen del cliente y las peliculas que a visto
CREATE OR ALTER view clientes_pais AS 
SELECT
cli.nombre_cliente AS 'cliente',
cli.apellido_cliente AS 'apellidos',
p.nom_pais AS 'Pais',
COUNT(v.id_vistas) AS vistas
FROM  cliente cli
INNER JOIN pais p ON cli.cod_pais = p.cod_pais
LEFT JOIN vistas v ON cli.cod_cliente = v.cod_cliente
GROUP BY cli.nombre_cliente, cli.apellido_cliente, p.nom_pais;
GO

SELECT * FROM clientes_pais
GO

--PROCEDIMIENTO 1
--Buscar pelicula por categoria

CREATE OR ALTER PROCEDURE SP_Categoria_pelicula @nombre_categ VARCHAR(15)
AS
BEGIN
IF EXISTS(  SELECT p.id_pelicula, p.titulo_peli
FROM Peliculas p
INNER JOIN Categorias c ON p.id_pelicula = c.id_pelicula
WHERE c.nombre_categ = @nombre_categ
)
SELECT p.id_pelicula, p.titulo_peli
FROM Peliculas p
INNER JOIN Categorias c ON p.id_pelicula = c.id_pelicula
WHERE c.nombre_categ = @nombre_categ;
END
ELSE
BEGIN
PRINT 'No hay peliculas registradas en la categoria'
END

EXECUTE SP_Categoria_pelicula'comedia'
GO

--Procedimiento 2
--Procedimiento para agregar una pelicula

CREATE PROCEDURE SP_Agregar_peli
(@id_pelicula CHAR(5), @titulo_peli VARCHAR(50), @idioma_principal VARCHAR(15),@pais_origen CHAR(4),@valoracion_peli VARCHAR(20),
 @fecha_estreno DATE,@id_categoria CHAR(5), @nombre_categ VARCHAR(15))
AS
BEGIN
INSERT INTO Peliculas 
(id_pelicula, titulo_peli, idioma_principal, pais_origen, valoracion_peli, fecha_estreno)
VALUES
(@id_pelicula, @titulo_peli, @idioma_principal, @pais_origen, @valoracion_peli, @fecha_estreno);
INSERT INTO Categorias 
(id_categoria, id_pelicula, nombre_categ)
VALUES
(@id_categoria, @id_pelicula, @nombre_categ);
END
GO

EXECUTE SP_Agregar_peli 'P0017','Al fondo hay sitio','Español','0001','5 estrellas','2024-05-11','C0003','Comedia'
GO

--Procedimiento 3
--Procedimiento para eliminar una pelicula

CREATE OR ALTER PROCEDURE  SP_Eliminar_peli @id_pelicula CHAR(5)
AS
BEGIN
DELETE FROM Peliculas WHERE id_pelicula = @id_pelicula
DELETE FROM Categorias WHERE id_pelicula = @id_pelicula
END
GO

EXECUTE SP_Eliminar_peli 'P0017'
GO

--PROCEDIMIENTO 4
--Procedimiento para agregar mas clientes

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

--Procedimiento 5
--Registrar vista de una pelicula

CREATE OR ALTER PROCEDURE SP_nueva_vista
@fch_vista DATE , @id_vistas CHAR(4),@id_pelicula CHAR(5),@cod_cliente CHAR(6)
AS
BEGIN
-- Verifica que la película y el cliente existen
IF EXISTS (SELECT 1 FROM Peliculas WHERE id_pelicula = @id_pelicula)
    AND EXISTS (SELECT 1 FROM Cliente WHERE cod_cliente = @cod_cliente)
BEGIN
-- Inserta una nueva fila en la tabla vistas
INSERT INTO Vistas (id_vistas, cod_cliente, id_pelicula, fch_vista)
VALUES (@id_vistas, @cod_cliente, @id_pelicula, @fch_vista);
END

ELSE
BEGIN
PRINT 'El id_pelicula o el cod_cliente no son válidos.';
END

END;
GO

EXECUTE SP_nueva_vista '2024-08-29', 'VT11', 'P0001', 'U00001';
GO

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

--Procedimiento 7
--Eliminar un cliente

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

--Procedimiento 8
--Cambiar la categoria de una pelicula existente
CREATE OR ALTER PROCEDURE SP_Cambiar_Categoria_Pelicula
(@id_categoria CHAR(5),@id_pelicula CHAR(5),@nombre_categ VARCHAR(15))
AS
BEGIN

UPDATE Categorias
SET nombre_categ = @nombre_categ
WHERE  id_categoria = @id_categoria AND id_pelicula = @id_pelicula;
END
GO

EXECUTE SP_Cambiar_CATEGORIA_PELICULA'C0001','P0001','romance'
GO

--Procedimiento 9
--Para cambiar el metodo de pago

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