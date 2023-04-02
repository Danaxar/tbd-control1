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

---------------- R E S P U E S T A:  Obtener los nombres de los trabajadores --------
SELECT v3.year, v3.max, empleado.nombre, empleado.apellido
FROM v3
	JOIN vendedor ON v3.id_vendedor = vendedor.id_vendedor
	JOIN empleado ON vendedor.id_empleado = empleado.id_empleado;
-------------------------------------------------------------------------------------

--- Pregunta 8: El vendedor con más productos vendidos por tienda
-- Obtener 
drop view if exists v12;
drop view if exists v11;
drop view if exists v10;
drop view if exists v9;

-- id_productoventa | nombre | apellido
drop view if exists v9;
create view v9 as (
	select pd.id_productoventa, vend.id_vendedor, v.id_tienda
	from prod_venta as pd
		-- Juntar con ventas para obtener el id del vendedor
		join venta as v on pd.id_venta = v.id_venta
		-- Juntar con vendedor para obtener el id de empleado
		join vendedor as vend on vend.id_vendedor = v.id_vendedor
);
select * from v9;

-- Obtener la cantidad total de productos vendidos por vendedor
drop view if exists v10;
create view v10 as (
	select id_vendedor, id_tienda, count(*) as vendidos 
	from v9 
	group by id_vendedor, id_tienda 
	order by id_vendedor
);
select * from v10;

-- Agrupar por tienda y mantener lo que tienen el máximo
drop view if exists v11;
create view v11 as (
	select id_tienda, max(vendidos)
	from v10
	group by id_tienda
	order by id_tienda
);

create view v12 as (
	select v11.id_tienda, v10.id_vendedor, v10.vendidos
	from v11 join v10 on v11.max = v10.vendidos and v11.id_tienda = v10.id_tienda
	order by v11.id_tienda
);

---------------- R E S P U E S T A: Coincidir el numero de ventas y tienda con empleado de dicha tienda con dichas ventas
select tienda.nombre, empleado.nombre, empleado.apellido, v12.vendidos
from v12
	join tienda on v12.id_tienda = tienda.id_tienda
	join vendedor on v12.id_vendedor = vendedor.id_vendedor
	join empleado on vendedor.id_empleado = empleado.id_empleado
-----------------------------------------------------------------------------



-- Preguntas 9 y 10

-- Fin