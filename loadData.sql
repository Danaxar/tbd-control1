-- Inicio
-- Para las preguntas 1 y 2
DELETE FROM prod_venta;
DELETE FROM venta;
DELETE FROM producto;
DELETE FROM vendedor;
DELETE FROM tienda_emp;
DELETE FROM tienda;
DELETE FROM empleado;
DELETE FROM sueldo;
DELETE FROM tipo_doc;
DELETE FROM comuna;
ALTER SEQUENCE prod_venta_id_productoventa_seq RESTART WITH 1;
ALTER SEQUENCE venta_id_venta_seq RESTART WITH 1;
ALTER SEQUENCE producto_id_producto_seq RESTART WITH 1;
ALTER SEQUENCE vendedor_id_vendedor_seq RESTART WITH 1;
ALTER SEQUENCE tienda_emp_id_tiendaemp_seq RESTART WITH 1;
ALTER SEQUENCE tienda_id_tienda_seq RESTART WITH 1;
ALTER SEQUENCE empleado_id_empleado_seq RESTART WITH 1;
ALTER SEQUENCE sueldo_id_sueldo_seq RESTART WITH 1;
ALTER SEQUENCE tipo_doc_id_tipodoc_seq RESTART WITH 1;
ALTER SEQUENCE comuna_id_comuna_seq RESTART WITH 1;


INSERT INTO comuna(nombre) VALUES('Maipu');
INSERT INTO tienda(nombre, id_comuna) VALUES('Hites', 1);
INSERT INTO tienda(nombre, id_comuna) VALUES('Ripley', 1);

-- Crear comuna
INSERT INTO comuna(nombre) VALUES('Puente Alto');
INSERT INTO comuna(nombre) VALUES('Santiago');
INSERT INTO comuna(nombre) VALUES('Providencia');
INSERT INTO comuna(nombre) VALUES('Las Condes');
INSERT INTO comuna(nombre) VALUES('Ñuñoa');

-- Crear tienda
INSERT INTO tienda(nombre, id_comuna) VALUES('Tienda A', 1);
INSERT INTO tienda(nombre, id_comuna) VALUES('Tienda B', 1);
INSERT INTO tienda (nombre, id_comuna) VALUES ('Tienda C', 3);
INSERT INTO tienda (nombre, id_comuna) VALUES ('Tienda D', 4);
INSERT INTO tienda (nombre, id_comuna) VALUES ('Tienda E', 5);

-- Insertar datos en la tabla empleado
INSERT INTO empleado (nombre, apellido, id_comuna) VALUES
  ('Juan', 'Pérez', 1),
  ('María', 'González', 2),
  ('Pedro', 'Rodríguez', 3),
  ('Carla', 'Díaz', 4),
  ('Miguel', 'Vega', 5);


-- Crear vendedores
INSERT INTO vendedor(id_empleado) VALUES (1), (2), (3); --DA ERROR
INSERT INTO vendedor(id_empleado) VALUES (2), (2), (3);
INSERT INTO vendedor(id_empleado) VALUES (3), (2), (3);
INSERT INTO vendedor(id_empleado) VALUES (4), (2), (3);
INSERT INTO vendedor(id_empleado) VALUES (5), (2), (3);

-- Crear productos
INSERT INTO producto(nombre, precio, id_tienda)
VALUES 
    ('Xiaomi mi 10T pro', 1500.00, 1),
    ('Huawei p50 pro', 1000.00, 1),
    ('Xbox One', 500.00, 1),
    ('Sony PlayStation 2', 20.00, 1),
    ('polera tommy hilfiger', 20.00, 2),
    ('polera nike', 10.00, 2),
    ('polera adidas', 15.00, 2),
	('polera adidas2', 15.00, 3),
	('polera adidas3', 15.00, 4),
	('polera adidas4', 15.00, 5),
    ('polera puma', 7.00, 2);


-- Insertar datos en la tabla tipo_doc
INSERT INTO tipo_doc (nombre) VALUES
  ('Boleta'),
  ('Factura');

  
  INSERT INTO venta(total, fecha, id_tienda, id_tipodoc, id_vendedor)
  VALUES
    (1500.00, '01/01/2021', 1, 1, 1),
    (6000.00, '01/02/2021', 1, 1, 2),
    (2000.00, '01/03/2021', 1, 1, 3),
	(120.00,  '01/04/2021', 4, 2, 4),
    (80.00,   '01/05/2021', 5, 1, 5);
	
-- Insertar datos en la tabla prod_venta 
INSERT INTO prod_venta (id_producto, id_venta) VALUES  
  (1, 1),
  (1, 1),
  (2, 1),
  (2, 2),
  (2, 2),
  (3, 2); 


-- Insertar datos en la tabla sueldo
INSERT INTO sueldo (cargo, monto) VALUES
  ('Vendedor', 500.00),
  ('Supervisor', 1000.00),
  ('Gerente', 2000.00);

/*
Pregunta 1: Suponiendo.. las ventas se generan en la tabla prod_venta

1 es Xiaomi, 2 Huawei
(id_producto, id_venta) 

  (1, 1), -> xiaomi se vendio el mes 1
  (1, 1), -> xiaomi se vendio el mes 1
  (2, 1), -> huawei se vendio el mes 1

GANADOR DEL MES 1 XIAOMI

  (2, 2), -> huawei se vendio el mes 2
  (2, 2), -> huawei se vendio el mes 2
  (3, 2); -> xbox se vendio el mes 2

GANADOR DEL MES 2 HUAWEI



Pregunta 2: Suponiendo..


    Hites vende:
        ('Xiaomi mi 10T pro', 1500.00, 1),
    |   ('Huawei p50 pro', 1000.00, 1),
        ('Xbox One', 500.00, 1),
        ('Sony PlayStation 2', 20.00, 1) -> Producto más barato

    Ripley vende:
        ('polera tommy hilfiger', 20.00, 2)
        ('polera nike', 10.00, 2)
        ('polera adidas', 15.00, 2)
        ('polera puma', 7.00, 2) -> Producto más barato

    Por lo tanto, la consulta deberia entregarnos:
        Hites -> Sony PlayStation 2 producto más barato
        Ripley -> polera puma producto más barato

*/

-- Para las preguntas 3 y 4

-- Pregunta 3 ventas por mes, separadas entre Boletas y Facturas.

DELETE FROM prod_venta;
DELETE FROM venta;
DELETE FROM producto;
DELETE FROM vendedor;
DELETE FROM tienda_emp;
DELETE FROM tienda;
DELETE FROM empleado;
DELETE FROM sueldo;
DELETE FROM tipo_doc;
DELETE FROM comuna;
ALTER SEQUENCE prod_venta_id_productoventa_seq RESTART WITH 1;
ALTER SEQUENCE venta_id_venta_seq RESTART WITH 1;
ALTER SEQUENCE producto_id_producto_seq RESTART WITH 1;
ALTER SEQUENCE vendedor_id_vendedor_seq RESTART WITH 1;
ALTER SEQUENCE tienda_emp_id_tiendaemp_seq RESTART WITH 1;
ALTER SEQUENCE tienda_id_tienda_seq RESTART WITH 1;
ALTER SEQUENCE empleado_id_empleado_seq RESTART WITH 1;
ALTER SEQUENCE sueldo_id_sueldo_seq RESTART WITH 1;
ALTER SEQUENCE tipo_doc_id_tipodoc_seq RESTART WITH 1;
ALTER SEQUENCE comuna_id_comuna_seq RESTART WITH 1;

INSERT INTO comuna(id_comuna, nombre) 
VALUES
	(1, 'Santiago'),
	(2, 'Estacion Central');
	
select * from tienda;

INSERT INTO tienda(nombre, id_comuna) VALUES('Hites', 1);
INSERT INTO tienda(nombre, id_comuna) VALUES('Ripley', 1);

INSERT INTO tipo_doc(nombre) VALUES ('Boleta'), ('Factura');


INSERT INTO empleado(nombre, apellido, id_comuna)
VALUES
    ('Daniel', 'Catalan', 1),
    ('Diego', 'Acuna', 1),
    ('Jhoisan', 'Allendes', 1);

INSERT INTO vendedor(id_empleado) VALUES (1), (2), (3);

INSERT INTO venta(total, fecha, id_tienda, id_tipodoc, id_vendedor)
VALUES
    (1500.00, '01/01/2020', 1, 1, 1),
    (6000.00, '01/01/2020', 1, 1, 2),
    (2000.00, '01/01/2020', 1, 1, 3);

-- 2021
INSERT INTO venta(total, fecha, id_tienda, id_tipodoc, id_vendedor)
VALUES
    (3000.00, '01/01/2021', 1, 2, 1),
    (4500.00, '01/01/2021', 1, 2, 2),
    (2000.00, '01/01/2021', 1, 2, 3);

-- 2022
INSERT INTO venta(total, fecha, id_tienda, id_tipodoc, id_vendedor)
VALUES
    (4500.00, '01/01/2022', 1, 1, 1),
    (3000.00, '01/01/2022', 1, 1, 2),
    (5000.00, '01/01/2022', 1, 1, 3);

-- 2023
INSERT INTO venta(total, fecha, id_tienda, id_tipodoc, id_vendedor)
VALUES
    (6000.00, '01/01/2023', 1, 2, 1),
    (1500.00, '01/01/2023', 1, 2, 2),
    (2000.00, '01/01/2023', 1, 2, 3);

-- 4. empleado que ganó más por tienda 2020, indicando la comuna donde vive y el cargo que tiene en la empresa

INSERT INTO sueldo(cargo, monto) 
VALUES
	('Operador', 600000),
	('Reponedor', 500000),
	('Jefe', 1000000);

INSERT INTO tienda_emp(id_empleado, id_tienda, id_sueldo, fecha)
VALUES
	(1,2,1, '01/01/2020'),
	(2,1,2, '01/01/2020'),
	(3,1,3, '01/01/2020');


-- Para las preguntas 5 y 6

-- Para las preguntas 7 y 8     D A N I E L 

DELETE FROM prod_venta;
DELETE FROM venta;
DELETE FROM producto;
DELETE FROM vendedor;
DELETE FROM tienda_emp;
DELETE FROM tienda;
DELETE FROM empleado;
DELETE FROM sueldo;
DELETE FROM tipo_doc;
DELETE FROM comuna;
ALTER SEQUENCE prod_venta_id_productoventa_seq RESTART WITH 1;
ALTER SEQUENCE venta_id_venta_seq RESTART WITH 1;
ALTER SEQUENCE producto_id_producto_seq RESTART WITH 1;
ALTER SEQUENCE vendedor_id_vendedor_seq RESTART WITH 1;
ALTER SEQUENCE tienda_emp_id_tiendaemp_seq RESTART WITH 1;
ALTER SEQUENCE tienda_id_tienda_seq RESTART WITH 1;
ALTER SEQUENCE empleado_id_empleado_seq RESTART WITH 1;
ALTER SEQUENCE sueldo_id_sueldo_seq RESTART WITH 1;
ALTER SEQUENCE tipo_doc_id_tipodoc_seq RESTART WITH 1;
ALTER SEQUENCE comuna_id_comuna_seq RESTART WITH 1;

-- Crear comuna
INSERT INTO comuna(nombre) VALUES('Maipu');

-- Crear tienda
INSERT INTO tienda(nombre, id_comuna) VALUES('Hites', 1);
INSERT INTO tienda(nombre, id_comuna) VALUES('Ripley', 1);

-- Crear empleados
INSERT INTO empleado(nombre, apellido, id_comuna)
VALUES
    ('Daniel', 'Catalan', 1),
    ('Diego', 'Acuna', 1),
    ('Jhoisan', 'Allendes', 1);

-- Crear vendedores
INSERT INTO vendedor(id_empleado) VALUES (1), (2), (3);

-- Crear productos
INSERT INTO producto(nombre, precio, id_tienda)
VALUES 
    ('iPhone 13 Pro Max', 1500.00, 1),
    ('Samsung Galaxy S21 Ultra', 1000.00, 1),
    ('Sony PlayStation 5', 500.00, 1);

-- Crear tipo documento
INSERT INTO tipo_doc(nombre) VALUES ('Boleta'), ('Factura');

-- Crear ventas
/*
Suponiendo:
    Daniel vende:
        2020: 1 iphone = 1500 (3)
        2021: 2 iphone = 3000 (2)
        2022: 3 iphone = 4500 (2)
        2023: 4 iphone = 6000 (1) W
    Diego vende:
        2020: 4 samsung = 6000 (1) W
        2021: 3 samsung = 4500 (1) W
        2022: 2 samsung = 3000 (3)
        2023: 1 samsung = 1500 (3)
    Jhoisan vende:
        2020: 4  play station 5 = 2000 (2)
        2021: 4  play station 5 = 2000 (3)
        2022: 10 play station 5 = 5000 (1) W
        2023: 4  play station 5 = 2000 (2)

    Por lo tanto, si se pregunta por el vendedor que más ha vendido en cada año
    La salida debería ser:

                            año  | vendedor
                            ---------------
                            2020 |  Diego
                            2021 |  Diego
                            2022 |  Jhoisan
                            2023 |  Daniel
    
*/
-- Se hacen todas las ventas en hites y se entrega boleta
-- 2020
INSERT INTO venta(total, fecha, id_tienda, id_tipodoc, id_vendedor)
VALUES
    (1500.00, '01/01/2020', 1, 1, 1),
    (6000.00, '01/01/2020', 1, 1, 2),
    (2000.00, '01/01/2020', 1, 1, 3);

-- 2021
INSERT INTO venta(total, fecha, id_tienda, id_tipodoc, id_vendedor)
VALUES
    (3000.00, '01/01/2021', 1, 1, 1),
    (4500.00, '01/01/2021', 1, 1, 2),
    (2000.00, '01/01/2021', 1, 1, 3);

-- 2022
INSERT INTO venta(total, fecha, id_tienda, id_tipodoc, id_vendedor)
VALUES
    (4500.00, '01/01/2022', 1, 1, 1),
    (3000.00, '01/01/2022', 1, 1, 2),
    (5000.00, '01/01/2022', 1, 1, 3);

-- 2023
INSERT INTO venta(total, fecha, id_tienda, id_tipodoc, id_vendedor)
VALUES
    (6000.00, '01/01/2023', 1, 1, 1),
    (1500.00, '01/01/2023', 1, 1, 2),
    (2000.00, '01/01/2023', 1, 1, 3);

INSERT INTO prod_venta(id_producto, id_venta)
VALUES
	-- 2020
	-- 1 iphone
	(1, 1),
	-- 4 samsung
	(2, 2),(2, 2),(2, 2),(2, 2),
	-- 4 ps5
	(3, 3),(3, 3),(3, 3),(3, 3),
	
	-- 2021
	-- 2 iphone
	(1,4),(1,4),
	-- 3 samsung
	(2,5),(2,5),(2,5),
	-- 4 ps5
	(3, 6),(3, 6),(3, 6),(3, 6),
	
	-- 2022
	-- 3 iphone
	(1,7),(1,7),(1,7),
	-- 2 samsung
	(2, 8),(2, 8),
	-- 10 ps5
	(3, 9),(3, 9),(3, 9),(3, 9),(3, 9),
	(3, 9),(3, 9),(3, 9),(3, 9),(3, 9),
	
	--2023
	-- 4 iphone
	(1,10),(1,10),(1,10),(1,10),
	-- 1 samsung
	(2,11),
	-- 4 ps5
	(3,12),(3,12),(3,12),(3,12);
	

--- Datos para la pregunta 8
/*
    Utilizando los mismos datos:
        Daniel lleva 10 productos vendidos en Hites
        Jhoisan lleva 22 productos vendidos en Hites
    
    Se agregará a Alan Donoso como vendedor de 15 productos en Ripley
    Se agregará a Diego Ramirez como vendedor de 16 productos en ripley

    Por lo tanto, la salida debería ser:
        Hites: Jhoisan
        Ripley: Diego Ramirez

*/
-- Crear 2 empleados nuevos
INSERT INTO empleado(nombre, apellido, id_comuna)
VALUES
    ('Alan', 'Donoso', 1),
    ('Diego', 'Ramirez', 1);

-- Crear los vendedores
INSERT INTO vendedor(id_empleado) VALUES (4), (5);

INSERT INTO sueldo(cargo, monto) VALUES ('Operador', 500000);

-- Asignarlos empleados a tienda
INSERT INTO tienda_emp(id_empleado, id_tienda, id_sueldo, fecha)
VALUES
	(1,1,1, '01/01/2023'),
	(2,1,1, '01/01/2023'),
	(3,1,1, '01/01/2023'),
	
	(4,2,1, '01/01/2023'),
	(5,2,1, '01/01/2023');

--! Ventas
INSERT INTO venta(total, fecha, id_tienda, id_tipodoc, id_vendedor)
VALUES
    (1000000.00, '01/01/2023', 2, 1, 4),
    (1000000.00, '01/01/2023', 2, 1, 5);

INSERT INTO prod_venta(id_producto, id_venta)
VALUES
	-- 15 veces
    (1,13),(1,13),(1,13),(1,13),(1,13),
    (1,13),(1,13),(1,13),(1,13),(1,13),
    (1,13),(1,13),(1,13),(1,13),(1,13),

	-- 16 veces
    (2,14),(2,14),(2,14),(2,14),
    (2,14),(2,14),(2,14),(2,14),
    (2,14),(2,14),(2,14),(2,14),
    (2,14),(2,14),(2,14),(2,14);

-- Para las preguntas 9 y 10

-- Fin