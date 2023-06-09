
-- ATENCION, EJECUTAR EL SIGUIENTE COMANDO ANTES DE EJECUTAR COMPLETAMENTE EL PROGRAMA
-----------------------------
--> CREATE DATABASE controltbd;
-----------------------------
-- Borrar tablas si es que existen
DROP VIEW IF EXISTS a3;
DROP VIEW IF EXISTS a2;
DROP VIEW IF EXISTS a1;
DROP VIEW IF EXISTS c4;
DROP VIEW IF EXISTS c3;
DROP VIEW IF EXISTS c2;
DROP VIEW IF EXISTS c1;
drop view if exists v12;
drop view if exists v11;
drop view if exists v10;
DROP VIEW IF EXISTS v9;
DROP VIEW IF EXISTS v8;
DROP VIEW IF EXISTS v7;
DROP VIEW IF EXISTS v6;
DROP VIEW IF EXISTS v5;
DROP VIEW IF EXISTS v4;
DROP VIEW IF EXISTS v3;
DROP VIEW IF EXISTS v2;
DROP VIEW IF EXISTS v1;
DROP VIEW IF EXISTS b4;
DROP VIEW IF EXISTS b3;
DROP VIEW IF EXISTS b2;
DROP VIEW IF EXISTS b1;
DROP TABLE IF EXISTS prod_venta;
DROP TABLE IF EXISTS venta;
DROP TABLE IF EXISTS producto;
DROP TABLE IF EXISTS vendedor;
DROP TABLE IF EXISTS tienda_emp;
DROP TABLE IF EXISTS tienda;
DROP TABLE IF EXISTS empleado;
DROP TABLE IF EXISTS sueldo;
DROP TABLE IF EXISTS tipo_doc;
DROP TABLE IF EXISTS comuna;
/*Si los drop fallan, eliminar las vistas que dependen de estas tablas*/

CREATE TABLE comuna (
  id_comuna SERIAL PRIMARY KEY,
  nombre VARCHAR(50) NOT NULL
);

CREATE TABLE tienda (
  id_tienda SERIAL PRIMARY KEY,
  nombre VARCHAR(50) NOT NULL,
  -- FK
  id_comuna INT NOT NULL,
  FOREIGN KEY (id_comuna) REFERENCES comuna(id_comuna)
);

CREATE TABLE tipo_doc (
  id_tipodoc SERIAL PRIMARY KEY,
  nombre VARCHAR(50) NOT NULL
);

CREATE TABLE empleado (
  id_empleado SERIAL PRIMARY KEY,
  nombre VARCHAR(50) NOT NULL,
  apellido VARCHAR(50) NOT NULL,
  -- FK
  id_comuna INT NOT NULL,
  FOREIGN KEY (id_comuna) REFERENCES comuna(id_comuna)
);

CREATE TABLE vendedor (
  id_vendedor SERIAL PRIMARY KEY,
  -- FK
  id_empleado INT NOT NULL,
  FOREIGN KEY (id_empleado) REFERENCES empleado(id_empleado)
);

CREATE TABLE producto (
  id_producto SERIAL PRIMARY KEY,
  nombre VARCHAR(50) NOT NULL,
  precio DECIMAL(10,2) NOT NULL,
  -- FK
  id_tienda INT NOT NULL,
  FOREIGN KEY (id_tienda) REFERENCES tienda(id_tienda)
);

CREATE TABLE venta (
  id_venta SERIAL PRIMARY KEY,
  total DECIMAL(10,2) NOT NULL,
  fecha DATE NOT NULL,
  -- FK
  id_tienda INT NOT NULL,
  id_tipodoc INT NOT NULL,
  id_vendedor INT NOT NULL,
  FOREIGN KEY (id_tienda) REFERENCES tienda(id_tienda),
  FOREIGN KEY (id_tipodoc) REFERENCES tipo_doc(id_tipodoc),
  FOREIGN KEY (id_vendedor) REFERENCES vendedor(id_vendedor)
);

CREATE TABLE prod_venta (
  id_productoventa SERIAL PRIMARY KEY,
  -- FK
  id_venta INT NOT NULL,
  id_producto INT NOT NULL,
  FOREIGN KEY (id_venta) REFERENCES venta(id_venta),
  FOREIGN KEY (id_producto) REFERENCES producto(id_producto)
);

CREATE TABLE sueldo (
  id_sueldo SERIAL PRIMARY KEY,
  cargo VARCHAR(50) NOT NULL,
  monto DECIMAL(10,2) NOT NULL
);

CREATE TABLE tienda_emp (
    id_tiendaemp SERIAL PRIMARY KEY,
    fecha DATE NOT NULL,
    -- FK
	id_empleado INT NOT NULL,
  	id_tienda INT NOT NULL,
    id_sueldo INT NOT NULL,
  	FOREIGN KEY (id_empleado) REFERENCES empleado(id_empleado),
  	FOREIGN KEY (id_tienda) REFERENCES tienda(id_tienda),
    FOREIGN KEY (id_sueldo) REFERENCES sueldo(id_sueldo)
);
