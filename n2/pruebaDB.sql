Creación base de datos


CREATE DATABASE prueba_db

CREATE TABLE categoria(
id_categoria SERIAL PRIMARY KEY,
nombre_categoria VARCHAR (40),
descripcion VARCHAR (50)
);


CREATE TABLE precio_producto(
id_precio SERIAL PRIMARY KEY,
precio_unitario VARCHAR (10),
iva VARCHAR (10),
subtotal_producto VARCHAR (20)
);


CREATE TABLE producto(                                              
id_producto SERIAL PRIMARY KEY ,                                                nombre_producto VARCHAR (40),                                                   descripcion VARCHAR (40),                                                       categoria_id INT REFERENCES categoria(id_categoria),                            precio_id INT REFERENCES precio_producto (id_precio)                            );



CREATE TABLE cliente(
id_cliente SERIAL PRIMARY KEY,
nombre_cliente VARCHAR(50),
rut_cliente VARCHAR (40),
direccion_cliente VARCHAR (50)
);

CREATE TABLE factura (
id_factura SERIAL PRIMARY KEY ,
cliente_id INT REFERENCES cliente(id_cliente),
producto_id INT REFERENCES producto(id_producto),
fecha_factura DATE,
unidades_compra VARCHAR (30)
);





Ingreso de datos a tablas 


 \copy cliente(nombre_cliente,rut_cliente,direccion_cliente) FROM 'Desktop/clientes.csv' csv HEADER;
COPY 5

prueba_db=# \copy categoria(nombre_categoria,descripcion) FROM 'Desktop/categorias.csv' csv HEADER;
COPY 3

prueba_db=# \copy precio_producto(precio_unitario,iva,subtotal_producto) FROM 'Desktop/precios.csv' csv HEADER;
COPY 8

prueba_db=# \copy producto(nombre_producto,descripcion,categoria_id,precio_id) FROM 'Desktop/productos.csv' csv HEADER;
COPY 8


Ingreso datos a clientes:


prueba_db=# INSERT INTO factura(cliente_id,producto_id,fecha_factura,unidades_compra) VALUES ('9', '8','2020-07-09','2');
INSERT 0 1
prueba_db=# INSERT INTO factura(cliente_id,producto_id,fecha_factura,unidades_compra) VALUES ('9', '6','2020-07-12','3');
INSERT 0 1
prueba_db=# INSERT INTO factura(cliente_id,producto_id,fecha_factura,unidades_compra) VALUES ('10', '5','2020-07-12','3');
INSERT 0 1
prueba_db=# INSERT INTO factura(cliente_id,producto_id,fecha_factura,unidades_compra) VALUES ('10', '12','2020-07-12','2');
INSERT 0 1
prueba_db=# INSERT INTO factura(cliente_id,producto_id,fecha_factura,unidades_compra) VALUES ('10', '11','2020-07-15','3');
INSERT 0 1
prueba_db=# INSERT INTO factura(cliente_id,producto_id,fecha_factura,unidades_compra) VALUES ('11', '5','2020-07-19','1');
INSERT 0 1
prueba_db=# INSERT INTO factura(cliente_id,producto_id,fecha_factura,unidades_compra) VALUES ('12', '9','2020-07-24','2');
INSERT 0 1
prueba_db=# INSERT INTO factura(cliente_id,producto_id,fecha_factura,unidades_compra) VALUES ('12', '8','2020-07-24','3');
INSERT 0 1
prueba_db=# INSERT INTO factura(cliente_id,producto_id,fecha_factura,unidades_compra) VALUES ('12', '7','2020-07-24','4');
INSERT 0 1
prueba_db=# INSERT INTO factura(cliente_id,producto_id,fecha_factura,unidades_compra) VALUES ('12', '6','2020-07-24','1');
INSERT 0 1
prueba_db=# 





Preguntas



Select cliente.nombre_cliente , factura.unidades_compra, producto.nombre_producto,precio_producto.subtotal_producto
From cliente
Inner Join factura On cliente.id_cliente = factura.cliente_id
Inner Join producto On factura.producto_id = producto.id_producto
Inner Join precio_producto On precio_producto.id_precio=producto.precio_id


SELECT cliente.nombre_cliente , factura.unidades_compra, producto.nombre_producto,precio_producto.subtotal_producto
From cliente
Inner Join factura On cliente.id_cliente = factura.cliente_id
Inner Join producto On factura.producto_id = producto.id_producto
Inner Join precio_producto On precio_producto.id_precio=producto.precio_id
WHERE subtotal_producto >100;





SELECT cliente.nombre_cliente , factura.unidades_compra, producto.nombre_producto,precio_producto.subtotal_producto
From cliente
Inner Join factura On cliente.id_cliente = factura.cliente_id
Inner Join producto On factura.producto_id = producto.id_producto
Inner Join precio_producto On precio_producto.id_precio=producto.precio_id
WHERE id_producto=‘10’;