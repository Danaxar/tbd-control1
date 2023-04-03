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

-- Query de respuesta 3, se asume que se debe incluir el año ya que a pesar de ser el mismo mes
-- pueden ser de años distintos.
SELECT id_tipodoc, extract(MONTH from fecha) as mes, extract(YEAR from fecha) as an, SUM(total) AS ventas_mes
FROM venta
GROUP BY mes, an, id_tipodoc
ORDER BY an, mes;

-- Query de respuesta 4

DROP VIEW IF EXISTS b2;
DROP VIEW IF EXISTS b1;

CREATE VIEW b1 AS (
SELECT E.id_empleado, E.nombre, E.Apellido, comuna.nombre as comuna, S.cargo, S.monto, Tie.fecha, Tie.id_tienda
FROM empleado E
INNER JOIN tienda_emp Tie ON E.id_empleado = Tie.id_empleado
INNER JOIN Sueldo S ON Tie.id_sueldo = S.id_sueldo
INNER JOIN comuna ON comuna.id_comuna = E.id_comuna
WHERE extract(year from fecha) = '2020');

CREATE VIEW b2 AS (
SELECT b1.id_tienda, MAX(b1.monto) AS max_monto
FROM b1
GROUP BY b1.id_tienda);

SELECT b1.id_tienda, b1.id_empleado, b1.nombre, b1.apellido, b1.comuna, b1.cargo, b2.max_monto
FROM b1, b2
WHERE b1.id_tienda = b2.id_tienda AND b2.max_monto = b1.monto;

-- Preguntas 5 y 6
-- Pregunta 5: Obtener el nombre de la tienda con menos empleados
SELECT t.nombre, COUNT(te.id_empleado) as num_empleados
FROM tienda t
JOIN tienda_emp te ON t.id_tienda = te.id_tienda
GROUP BY t.id_tienda
HAVING COUNT(*) = (
    SELECT MIN(cant_empleados)
    FROM (
        SELECT COUNT(*) as cant_empleados
        FROM tienda_emp
        GROUP BY id_tienda
    ) AS emp_tienda
) LIMIT 1;
-- Pregunta 6: Obtener el vendedor con más ventas por mes
SELECT DISTINCT ON (date_trunc('month', v.fecha)) 
	e.nombre, e.apellido, date_trunc('month', v.fecha) AS mes, COUNT(*) AS ventas
FROM venta v
JOIN vendedor vd ON v.id_vendedor = vd.id_vendedor
JOIN empleado e ON vd.id_empleado = e.id_empleado
GROUP BY date_trunc('month', v.fecha), v.id_vendedor, e.nombre, e.apellido
ORDER BY date_trunc('month', v.fecha), ventas DESC;

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
	join empleado on vendedor.id_empleado = empleado.id_empleado;
-----------------------------------------------------------------------------



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
JOIN empleado e on a3.id_empleado =e.id_empleado;


--Pregunta 10
DROP VIEW IF EXISTS c4;
DROP VIEW IF EXISTS c3;
DROP VIEW IF EXISTS c2;
DROP VIEW IF EXISTS c1;
-- Cambia la fecha por mes
CREATE VIEW c1 AS (
    SELECT id_venta, total, EXTRACT(MONTH FROM fecha) AS mes, id_tienda
    FROM venta
);
-- Agrupamos las ganancias de cada tienda por mes
CREATE VIEW c2 AS (
    SELECT c1.id_tienda, c1.mes, SUM(c1.total)
    FROM c1
    GROUP BY c1.id_tienda, c1.mes
);
-- Obtenemos el minimo de cada mes en ventas
CREATE VIEW c3 AS (
    SELECT c2.mes, MIN(c2.sum)
    FROM c2
    GROUP BY c2.mes
);
-- Asociamos la tienda que tiene el minimo recaudado en ventas por mes
CREATE VIEW c4 AS (
	SELECT c3.mes, c3.min, c2.id_tienda
	FROM c3, c2
	WHERE c3.min = c2.sum AND c3.mes = c2.mes
);
-- Mostramos el nombre de la tienda que tiene el minimo recaudado por mes
SELECT c4.mes, tienda.nombre, c4.min
FROM c4 JOIN tienda ON c4.id_tienda = tienda.id_tienda
ORDER BY c4.mes
-- Fin