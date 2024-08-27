--procedimiento2---------------------------------------------------------------------
--procedimiento para agregar una pelicula--
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

EXECUTE SP_Agregar_peli 'P0017','Al fondo hay sitio','Español','0001','5estrellas','2024-05-11','C0003','Comedia'
GO