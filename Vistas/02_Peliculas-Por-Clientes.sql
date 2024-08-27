--vista2------------
--peliculas vistas por cliente
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