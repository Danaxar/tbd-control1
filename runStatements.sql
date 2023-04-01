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

-- Preguntas 9 y 10

-- Fin