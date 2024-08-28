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