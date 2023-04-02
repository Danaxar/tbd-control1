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
-- Pregunta 5: Obtener el nombre de la tienda con menos empleados
SELECT t.nombre
FROM tienda t
JOIN (
	SELECT id_tienda, COUNT(*) as cant_empleados
	FROM tienda_emp
	GROUP BY id_tienda
	HAVING COUNT(*) = (
    SELECT MIN(cant_empleados)
    FROM (
		SELECT id_tienda, COUNT(*) as cant_empleados
		FROM tienda_emp
		GROUP BY id_tienda
    ) AS emp_tienda
	)
) AS tienda_emp_count ON t.id_tienda = tienda_emp_count.id_tienda LIMIT 1;
-- Pregunta 6: Obtener el vendedor con más ventas por mes
SELECT DISTINCT ON (date_trunc('month', v.fecha)) 
	v.id_vendedor, e.nombre, e.apellido, date_trunc('month', v.fecha) AS mes, COUNT(*) AS ventas
FROM venta v
JOIN vendedor vd ON v.id_vendedor = vd.id_vendedor
JOIN empleado e ON vd.id_empleado = e.id_empleado
GROUP BY date_trunc('month', v.fecha), v.id_vendedor, e.nombre, e.apellido
ORDER BY date_trunc('month', v.fecha), ventas DESC

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

---------------- R E S P U E S T A:  Obtener los nombres de los trabajadores
SELECT v3.year, v3.max, empleado.nombre, empleado.apellido
FROM v3
	JOIN vendedor ON v3.id_vendedor = vendedor.id_vendedor
	JOIN empleado ON vendedor.id_empleado = empleado.id_empleado;

--- Pregunta 8: El vendedor con más productos vendidos por tienda
-- Obtener 
drop view if exists v8;
drop view if exists v7;
drop view if exists v6;
drop view if exists v5;
drop view if exists v4;

-- Obtener id del empleado y sus ventas
create view v6 as (
	select empleado.id_empleado, count(*) as ventas
	from (
		-- Obtener id_productoventa e id_vendedor
		select id_productoventa, id_vendedor
		from prod_venta
			join venta on prod_venta.id_venta = venta.id_venta
	) as v5 
	-- Join con empleado para obtener el id de empleado
	join empleado on v5.id_vendedor = empleado.id_empleado
	group by empleado.id_empleado
);
select * from v6;

-- Agregar el nombre de la tienda en la que participa
create view v7 as (
	select v6.id_empleado, v6.ventas, tienda.nombre
	from v6
		join tienda_emp on tienda_emp.id_empleado = v6.id_empleado
		join tienda on tienda_emp.id_tienda = tienda.id_tienda
);
select * from v7;

-- Nombre de la tienda | Máxima cantidad de 
create view v8 as (
	select v7.nombre, max(v7.ventas)
	from v7
	group by nombre
);
select * from v8;

---------------- R E S P U E S T A: Coincidir el numero de ventas y tienda con empleado de dicha tienda con dichas ventas
select v8.nombre, v8.max, empleado.nombre, empleado.apellido
from v8, v7 join empleado on v7.id_empleado = empleado.id_empleado
where v8.max = v7.ventas;

-- Preguntas 9 y 10

-- Fin