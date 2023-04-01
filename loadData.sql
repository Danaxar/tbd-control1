-- Inicio
-- Para las preguntas 1 y 2

-- Para las preguntas 3 y 4

-- Para las preguntas 5 y 6

-- Para las preguntas 7 y 8
/*
Se necesitan varios vendedores -> varias tiendas
Se necesitan varias ventas -> varios productos
*/
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

-- Para las preguntas 9 y 10

-- Fin