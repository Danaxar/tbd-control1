-- Se limpian las tablas en caso de ser previamente pobladas
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

-- se resetea el conteo de id's
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

-- Comunas
INSERT INTO comuna (nombre) VALUES ('Santiago');
INSERT INTO comuna (nombre) VALUES ('Providencia');
INSERT INTO comuna (nombre) VALUES ('Maipú');
INSERT INTO comuna (nombre) VALUES ('Estación Central');

-- Tiendas
INSERT INTO tienda (nombre, id_comuna) VALUES ('Hites', 1);
INSERT INTO tienda (nombre, id_comuna) VALUES ('Ripley', 2);
INSERT INTO tienda (nombre, id_comuna) VALUES ('Falabella', 3);
INSERT INTO tienda (nombre, id_comuna) VALUES ('Paris', 4);
INSERT INTO tienda (nombre, id_comuna) VALUES ('Tricot', 2);
INSERT INTO tienda (nombre, id_comuna) VALUES ('Abcdin', 1);
INSERT INTO tienda (nombre, id_comuna) VALUES ('La Polar', 3);

-- Tipo de documento
INSERT INTO tipo_doc (nombre) VALUES ('Boleta'), ('Factura');


-- Empleado
INSERT INTO empleado (nombre, apellido, id_comuna)
VALUES 
  ('Sofía', 'López', 1),
  ('Martín', 'Castro', 2),
  ('Natalia', 'Torres', 3),
  ('Franco', 'Sánchez', 4),
  ('Valentina', 'Ramírez', 1),
  ('Juan', 'Gómez', 3),
  ('Camila', 'Fernández', 3),
  ('Lucas', 'Martínez', 4),
  ('Emilia', 'Pérez', 1),
  ('Tomás', 'González', 1),
  ('Isabella', 'Álvarez', 1),
  ('Mateo', 'Morales', 3),
  ('Olivia', 'Silva', 3),
  ('Benjamín', 'Ruiz', 4),
  ('Victoria', 'Castro', 4),
  ('Agustín', 'Herrera', 2),
  ('Amelia', 'Ortiz', 2),
  ('Ignacio', 'Flores', 2),
  ('Martina', 'González', 3),
  ('Santiago', 'García', 3),
  ('Ana', 'Rodríguez', 3),
  ('Facundo', 'Díaz', 2),
  ('Renata', 'Martínez', 3),
  ('Manuel', 'Castro', 4),
  ('Isidora', 'Pérez', 1);

-- Empleado
INSERT INTO vendedor (id_empleado) 
VALUES
	(1),  (2),  (3),  (4),  (5), 
	(6),  (7),  (8),  (9),  (10), 
	(11), (12), (13), (14), (15), 
	(16), (17), (18), (19), (20), 
	(21), (22), (23), (24), (25);

-- Producto
INSERT INTO producto (nombre, precio, id_tienda)
VALUES
  ('Bolso de mano', 3800, 1),
  ('Gorra', 4500, 2),
  ('Reloj de pulsera', 23800, 3),
  ('Cuaderno', 2800, 4),
  ('Gafas de sol', 8200, 5),
  ('Set de velas', 8900, 6),
  ('Cojín decorativo', 6900, 7),
  ('Caja de herramientas', 27000, 1),
  ('Cargador portátil', 21900, 2),
  ('Foco LED', 2600, 3),

  ('Organizador de escritorio', 9600, 4),
  ('Set de cubiertos', 12800, 5),
  ('Lámpara de techo', 22100, 6),
  ('Lupa', 3900, 7),
  ('Peluche', 5400, 1),
  ('Báscula de baño', 12700, 2),
  ('Funda para celular', 3500, 3),
  ('Set de cuchillos', 36000, 4),
  ('Cámara fotográfica', 32400, 5),
  ('Taza térmica', 6500, 6),

  ('Planta artificial', 18300, 7),
  ('Pintura acrílica', 4500, 1),
  ('Licuadora', 27900, 2),
  ('Estuche escolar', 4500, 3),
  ('Set de brochas de maquillaje', 14800, 4),
  ('Candelabro', 11400, 5),
  ('Bote de basura', 15200, 6),
  ('Portarretrato digital', 24000, 7),
  ('Pelota de tenis', 4200, 1),
  ('Cepillo de limpieza facial', 3200, 2),

  ('Almohadilla térmica', 14500, 3),
  ('Set de tenedores', 10300, 4),
  ('Set de copas', 17600, 5),
  ('Juego de mesa', 28000, 6),
  ('Espejo de pared', 15500, 7),
  ('Almohada', 7900, 1),
  ('Corbata', 12300, 2),
  ('Cámara de seguridad', 45700, 3),
  ('Cinturón', 9700, 4),
  ('Estuche de maquillaje', 13600, 5);
  -- 40 Productos en total
  
  
INSERT INTO venta(total, fecha, id_tienda, id_tipodoc, id_vendedor)
VALUES
  (25000, '2020-01-01', 1, 1, 1),
  (12500, '2020-02-01', 2, 2, 2),
  (32000, '2020-03-01', 3, 1, 3),
  (7400, '2020-04-01', 4, 2, 4),
  (16400, '2020-05-01', 5, 1, 5),
  (9200, '2020-06-01', 6, 2, 6),
  (31000, '2020-07-01', 7, 1, 7),
  (11250, '2020-08-01', 1, 2, 8),
  (21800, '2020-09-01', 2, 1, 9),
  (6300, '2020-10-01', 3, 2, 10),
  (13200, '2020-11-01', 4, 1, 11),
  (26500, '2020-12-01', 5, 2, 12),
  (14350, '2021-01-01', 6, 1, 13),
  (38500, '2021-02-01', 7, 2, 14),
  (8200, '2021-03-01', 1, 1, 15),
  (16250, '2021-04-01', 2, 2, 16),
  (29400, '2021-05-01', 3, 1, 17),
  (5600, '2021-06-01', 4, 2, 18),
  (17850, '2021-07-01', 5, 1, 19),
  (9900, '2021-08-01', 6, 2, 20),
  (22300, '2021-09-01', 7, 1, 21),
  (13400, '2021-10-01', 1, 2, 22),
  (18750, '2021-11-01', 2, 1, 23),
  (9400, '2021-12-01', 3, 2, 24),
  (30650, '2022-01-01', 4, 1, 25),
  (17400, '2022-02-01', 5, 2, 1),
  (11300, '2022-03-01', 6, 1, 2),
  (26200, '2022-04-01', 7, 2, 3),
  (14650, '2022-05-01', 1, 1, 4),
  (25500, '2022-06-01', 2, 2, 5),
  (18600, '2022-07-01', 3, 1, 6);
 
-- Producto venta
INSERT INTO prod_venta (id_producto, id_venta)
VALUES
  (1, 1),  (2, 1),  (3, 1),  (4, 2),  (5, 2),
  (6, 2),  (7, 3),  (8, 3),  (9, 4),  (10, 4),
  (11, 5),  (12, 5),  (13, 5),  (14, 6),  (15, 6),
  (16, 6),  (17, 7),  (18, 7),  (19, 7),  (20, 8),
  (21, 8),  (22, 8),  (23, 9),  (24, 9),  (25, 9),
  (26, 10),  (27, 10),  (28, 11),  (29, 11),  (30, 12),
  (31, 12),  (32, 12),  (33, 13),  (33, 13), (33, 13),  
  (35, 13), (36, 14),  (36, 14), (36, 14), 
  (37, 14),  (39, 15),  (39, 15), (40, 15);

INSERT INTO sueldo (cargo, monto)
VALUES
  ('Vendedor', 500000),
  ('Encargado de tienda', 700000),
  ('Jefe de tienda', 900000),
  ('Cajero', 450000),
  ('Visual merchandiser', 600000),
  ('Promotor de ventas', 450000),
  ('Asistente de ventas', 400000),
  ('Operador', 350000);
  
INSERT INTO tienda_emp (fecha, id_empleado, id_tienda, id_sueldo) VALUES
    ('2021-02-14', 11, 3, 7),
    ('2021-06-30', 19, 4, 4),
    ('2022-01-02', 10, 2, 3),
    ('2021-08-07', 14, 1, 1),
    ('2022-02-22', 23, 6, 5),
    ('2021-11-09', 1, 2, 2),
    ('2022-03-28', 5, 7, 5),
    ('2021-07-05', 22, 5, 8),
    ('2021-10-10', 7, 6, 3),
    ('2022-04-19', 20, 1, 6),
    ('2021-04-28', 6, 2, 2),
    ('2022-02-05', 18, 5, 6),
    ('2022-01-12', 13, 4, 1),
    ('2021-05-23', 12, 1, 4),
    ('2021-03-11', 16, 7, 4),
    ('2022-05-08', 21, 3, 8),
    ('2021-09-13', 17, 7, 1),
    ('2021-11-02', 9, 3, 6),
    ('2022-04-10', 3, 5, 7),
    ('2022-01-25', 8, 7, 5),
    ('2021-07-19', 15, 4, 3),
    ('2022-03-06', 4, 6, 4),
    ('2021-01-15', 2, 1, 5),
    ('2022-06-01', 24, 2, 7),
	  ('2020-08-12', 10, 4, 7),
    ('2020-12-12', 5, 6, 6),
    ('2020-01-23', 9, 5, 6),
    ('2020-09-05', 16, 5, 4),
    ('2020-11-06', 5, 7, 5),
    ('2020-07-16', 3, 2, 6),
    ('2020-01-19', 22, 1, 3),
    ('2021-01-20', 25, 7, 8);
