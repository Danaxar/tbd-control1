-- Inicio
-- Preguntas 1 y 2

-- Respuesta 1:

WITH ventas_2021 AS (
  SELECT id_venta, fecha, EXTRACT(MONTH FROM fecha) AS mes
  FROM venta
  WHERE EXTRACT(YEAR FROM fecha) = 2021
), ventas_producto AS (
  SELECT v.mes, pv.id_producto, COUNT(*) AS total_ventas
  FROM ventas_2021 v
  JOIN prod_venta pv ON pv.id_venta = v.id_venta
  GROUP BY v.mes, pv.id_producto
), productos_mes AS (
  SELECT vp.mes, p.nombre, vp.total_ventas,
         ROW_NUMBER() OVER (PARTITION BY vp.mes ORDER BY vp.total_ventas DESC) AS ranking
  FROM ventas_producto vp
  JOIN producto p ON p.id_producto = vp.id_producto
  WHERE vp.mes IS NOT NULL
)
SELECT pm.mes, pm.nombre AS producto_mas_vendido, pm.total_ventas
FROM productos_mes pm
WHERE pm.ranking = 1
ORDER BY pm.mes;


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

-- Preguntas 9 y 10

-- Fin