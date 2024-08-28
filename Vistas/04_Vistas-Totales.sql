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