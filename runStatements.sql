-- Inicio
-- Preguntas 1 y 2

-- Respuesta 2:
SELECT tienda.nombre AS nombre_tienda, producto.nombre AS nombre_producto, producto.precio
FROM tienda
JOIN producto ON tienda.id_tienda = producto.id_tienda
WHERE producto.precio = (
SELECT MIN(precio) FROM producto WHERE id_tienda = tienda.id_tienda
);

-- Preguntas 3 y 4

-- Preguntas 5 y 6

-- Preguntas 7 y 8
--- Pregunta 7: El vendedor que ha recaudado más dinero para la tienda por año
DROP VIEW IF EXISTS v3;
DROP VIEW IF EXISTS v2;
DROP VIEW IF EXISTS v1;

-- Obtener una tabla que sume todas las ganancias por id de vendedor por año
CREATE VIEW v1 AS (
	SELECT EXTRACT(YEAR FROM fecha) AS year, id_vendedor, SUM(total) AS total
	FROM venta
	GROUP BY id_vendedor, total, fecha
);

-- Obtener la venta máxima de cada año
CREATE VIEW v2 AS (
	SELECT year, MAX(total)
	FROM v1
	GROUP BY year
);

-- Unir esa venta máxima al id del vendedor
CREATE VIEW v3 AS (
	SELECT v2.year, v2.max, v1.id_vendedor
	FROM v2, v1
	WHERE v2.max = v1.total AND v2.year = v1.year ORDER BY year
);

-- Obtener los nombres de los trabajadores
SELECT v3.year, v3.max, empleado.nombre, empleado.apellido
FROM v3
	JOIN vendedor ON v3.id_vendedor = vendedor.id_vendedor
	JOIN empleado ON vendedor.id_empleado = empleado.id_empleado;

-- Una vez ejecutada la consulta de arriba, asegurese de eliminar las vistas
-- Con las consultas de la linea 18-20

--- Pregunta 8

-- Preguntas 9 y 10

-- Fin