# Integrantes 👤💻
- Daniel Catalán
- Diego Acuña
- Jhoisan Allendes
- Diego Ramirez
- Alan Donoso

# Modelo entidad relacion 🖍️
![Modelo Entidad Relacion](./Media/MR%20_%20MER%20TBD%20-%20MER%20Control1.png)
# Diccionario de datos 📚

### comuna
- id_comuna: entero secuencial que representa el identificador único de la comuna
- nombre: cadena de caracteres no nula que representa el nombre de la comuna

### tienda
- id_tienda: entero secuencial que representa el identificador único de la tienda
- nombre: cadena de caracteres no nula que representa el nombre de la tienda
- id_comuna: entero que representa el identificador de la comuna a la que pertenece la tienda

### tipo_doc
- id_tipodoc: entero secuencial que representa el identificador único del tipo de documento
- nombre: cadena de caracteres no nula que representa el nombre del tipo de documento

### empleado
- id_empleado: entero secuencial que representa el identificador único del empleado
- nombre: cadena de caracteres no nula que representa el nombre del empleado
- apellido: cadena de caracteres no nula que representa el apellido del empleado
- id_comuna: entero que representa el identificador de la comuna a la que pertenece el empleado

### vendedor
- id_vendedor: entero secuencial que representa el identificador único del vendedor
- id_empleado: entero que representa el identificador del empleado al que está asociado

### producto

- id_producto: entero secuencial que representa el identificador único del producto
- nombre: cadena de caracteres no nula que representa el nombre del producto
- precio: decimal no nulo que representa el precio del producto
- id_tienda: entero que representa el identificador de la tienda a la que pertenece el producto

### venta
- id_venta: entero secuencial que representa el identificador único de la venta
- total: decimal no nulo que representa el total de la venta
- fecha: fecha no nula que representa la fecha de la venta
- id_tienda: entero que representa el identificador de la tienda en la que se realizó la venta
- id_tipodoc: entero que representa el identificador del tipo de documento asociado a la venta
- id_vendedor: entero que representa el identificador del vendedor que realizó la venta

### prod_venta
- id_productoventa: entero secuencial que representa el identificador único de la relación entre producto y venta
- id_venta: entero que representa el identificador de la venta a la que pertenece la relación
- id_producto: entero que representa el identificador del producto asociado a la relación

### sueldo
- id_sueldo: entero secuencial que representa el identificador único del sueldo
- cargo: cadena de caracteres no nula que representa el cargo asociado al sueldo
- monto: decimal no nulo que representa el monto del sueldo

### tienda_emp
- id_tiendaemp: entero secuencial que representa el identificador único de la relación entre tienda y empleado
- fecha: fecha no nula que representa la fecha en la que se estableció la relación
- id_empleado: entero que representa el identificador del empleado asociado a la relación
- id_tienda: entero que representa el identificador de la tienda asociada a la relación
- id_sueldo: entero que representa el identificador del sueldo asociado a la relación
# Archivos 🗂️
- dbCreate.sql: Script para la creación de la base de datos
- loadData.sql: Script para la población de datos de la DB
- runStatements.sql: Script que contiene las consultas SQL