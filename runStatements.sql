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
-- Pregunta 9
 
DROP VIEW IF EXISTS a3;
DROP VIEW IF EXISTS a2;
DROP VIEW IF EXISTS a1;
--Cambia la fecha por mes
CREATE VIEW a1 as (
	SELECT te.id_empleado, EXTRACT(MONTH FROM te.fecha) mes,te.id_tiendaemp,s.monto
	FROM tienda_emp te, sueldo s
	WHERE te.id_sueldo = s.id_sueldo
	ORDER BY mes ASC
);
-- Obtener sueldo maximo por mes
CREATE VIEW a2 as (
	SELECT a1.mes, MAX(monto)
	FROM a1
	GROUP BY a1.mes
);
-- Asociar el empleado que tiene el sueldo maximo
CREATE VIEW a3 as (
	SELECT a2.mes, a2.max, a1.id_empleado
	FROM a2, a1
	WHERE a2.max = a1.monto AND a2.mes = a1.mes
);
-- Mostrar el nombre de la persona que tiene el sueldo maximo por mes
SELECT a3.mes,e.nombre, e.apellido, a3.max
FROM a3
JOIN empleado e on a3.id_empleado =e.id_empleado


--Pregunta 10
DROP VIEW IF EXISTS b4;
DROP VIEW IF EXISTS b3;
DROP VIEW IF EXISTS b2;
DROP VIEW IF EXISTS b1;
-- Cambia la fecha por mes
create view b1 as (
    SELECT id_venta, total, extract(MONTH FROM fecha) AS mes, id_tienda
    FROM venta
);
-- Agrupamos las ganancias de cada tienda por mes
create view b2 as (
    SELECT b1.id_tienda, b1.mes, sum(b1.total)
    FROM b1
    GROUP BY b1.id_tienda, b1.mes
);
-- Obtenemos el minimo de cada mes en ventas
create view b3 as (
    SELECT b2.mes, min(b2.sum)
    FROM b2
    GROUP BY b2.mes
);SELECT
-- Asociamos la tienda que tiene el minimo recaudado en ventas por mes
create view b4 as (
	SELECT b3.mes, b3.min, b2.id_tienda
	FROM b3, b2
	WHERE b3.min = b2.sum AND b3.mes = b2.mes
);
-- Mostramos el nombre de la tienda que tiene el minimo recaudado por mes
SELECT b4.mes, tienda.nombre, b4.min
FROM b4 JOIN tienda ON b4.id_tienda = tienda.id_tienda
ORDER BY b4.mes
-- Fin