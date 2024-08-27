-------vista3------
--valoraciones por pelicula
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