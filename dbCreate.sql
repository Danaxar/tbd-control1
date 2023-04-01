CREATE TABLE tipo_doc (
  id_tipodoc SERIAL PRIMARY KEY,
  nombre VARCHAR(50) NOT NULL
);

CREATE TABLE producto (
  id_producto SERIAL PRIMARY KEY,
  nombre VARCHAR(50) NOT NULL,
  precio DECIMAL(10,2) NOT NULL
);

CREATE TABLE venta (
  id_venta SERIAL PRIMARY KEY,
  total DECIMAL(10,2) NOT NULL,
  fecha DATE NOT NULL
);

CREATE TABLE prod_venta (
  id_productoventa SERIAL PRIMARY KEY,
  id_venta INT NOT NULL,
  id_producto INT NOT NULL,
  FOREIGN KEY (id_venta) REFERENCES venta(id_venta),
  FOREIGN KEY (id_producto) REFERENCES producto(id_producto)
);


CREATE TABLE tienda (
  id_tienda SERIAL PRIMARY KEY,
  nombre VARCHAR(50) NOT NULL
);

CREATE TABLE vendedor (
  id_vendedor SERIAL PRIMARY KEY,
  nombre VARCHAR(50) NOT NULL
);

CREATE TABLE comuna (
  id_comuna SERIAL PRIMARY KEY,
  nombre VARCHAR(50) NOT NULL
);

CREATE TABLE sueldo (
  id_sueldo SERIAL PRIMARY KEY,
  cargo VARCHAR(50) NOT NULL,
  monto DECIMAL(10,2) NOT NULL
);

CREATE TABLE empleado (
  id_empleado SERIAL PRIMARY KEY,
  nombre VARCHAR(50) NOT NULL,
  apellido VARCHAR(50) NOT NULL
);

CREATE TABLE tienda_emp (
  id_tiendaemp SERIAL PRIMARY KEY,
	id_empleado INT NOT NULL,
  	id_tienda INT NOT NULL,
  	FOREIGN KEY (id_empleado) REFERENCES empleado(id_empleado),
  	FOREIGN KEY (id_tienda) REFERENCES tienda(id_tienda)
);