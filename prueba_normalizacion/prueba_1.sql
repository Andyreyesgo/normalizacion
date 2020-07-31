CREATE DATABASE prueba;
CREATE DATABASE


CREATE TABLE categoria(                                                id_categoria SERIAL PRIMARY KEY,                                                nombre_categoria VARCHAR (20),                                                  descripcion VARCHAR(40)                                                         );
CREATE TABLE

CREATE TABLE producto(
prueba(# id_producto SERIAL PRIMARY KEY,
prueba(# nombre VARCHAR(30),
prueba(# descripcion_producto VARCHAR(40),
prueba(# categoria_id INT REFERENCES categoria(id_categoria)
prueba(# );
CREATE TABLE


CREATE TABLE precio_producto(
prueba(# id_precio SERIAL PRIMARY KEY,
prueba(# precio_unitario VARCHAR (20),
prueba(# iva INT, 
prueba(# Subtotal_unitario VARCHAR(20)
prueba(# );
CREATE TABLE

CREATE TABLE cliente(
prueba(# id_cliente SERIAL PRIMARY KEY,
prueba(# nombre VARCHAR (20),
prueba(# rut VARCHAR (30),
prueba(# direccion VARCHAR(40)
prueba(# );
CREATE TABLE


CREATE TABLE factura(
prueba(# id_factura SERIAL PRIMARY KEY,
prueba(# cliente_id INT REFERENCES cliente (id_cliente),
prueba(# fecha_factura DATE
prueba(# );
CREATE TABLE

CREATE TABLE listado_compra(
prueba(# orden_de_compra SERIAL PRIMARY KEY,
prueba(# factura_id INT REFERENCES factura(id_factura),
prueba(# producto_id INT REFERENCES producto(id_producto),
prueba(# precio_id INT REFERENCES precio_producto(id_precio),
prueba(# unidades VARCHAR(15),
prueba(# subtotal VARCHAR (20)
prueba(# );
CREATE TABLE



2.

Prueba de Carga de Clientes:

prueba=# INSERT INTO cliente(nombre,rut,direccion) VALUES ('Frank Garrido','17.515.749-2','Froilan Roa 6767');
INSERT 0 1
prueba=# INSERT INTO cliente(nombre,rut,direccion) VALUES ('Marcela Moreno','7.415.749-1','Fundo el peñon 37');
INSERT 0 1
prueba=# SELECT * FROM cliente;
 id_cliente |     nombre     |     rut      |     direccion     
------------+----------------+--------------+-------------------
          1 | Frank Garrido  | 17.515.749-2 | Froilan Roa 6767
          2 | Marcela Moreno | 7.415.749-1  | Fundo el peñon 37
(2 rows)


\copy cliente(nombre,rut,direccion) FROM 'Desktop/cliente_1.csv' csv header;
COPY 3
prueba=# SELECT*FROM cliente;
 id_cliente |     nombre     |      rut      |       direccion        
------------+----------------+---------------+------------------------
          1 | Frank Garrido  | 17.515.749-2  | Froilan Roa 6767
          2 | Marcela Moreno | 7.415.749-1   | Fundo el peñon 37
          4 | Gustavo Cerati |  23.456.788-2 |  Avenida Santa Rosa 23
          5 | Camila Garcia  |  23.455.555-1 |  Vickuña Mackena 33
          6 | Kurt Carrera   |  12.453.666-6 |  Fernandez Albano 45
(5 rows)


Carga de Categorias;

prueba=# SELECT * FROM categoria;
 id_categoria | nombre_categoria |         descripcion         
--------------+------------------+-----------------------------
            1 | Guitarras        | Guitarra Oregon
            2 | Bajos            | Bajo capsula fija
            3 | Bajos            | Bajo capsula montable
            4 | Bateria Tama     | Bateria Tama sin platillos
            5 | Bateria Mapex    | Bateria Mapex con platillos
(5 rows)

Prueba de Carga Productos:

prueba=# \copy producto(nombre,descripcion_producto,categoria_id) FROM 'Desktop/productos.csv' csv header;
COPY 8


id_producto |     nombre      | descripcion_producto | categoria_id 
-------------+-----------------+----------------------+--------------
           1 | Guitarra Fender | Modelo sg2300        |            1
          10 | Guitarra Fender |  Modelo ff2          |            1
          11 | Bajo Ibanez     |  modelo sub-3        |            2
          12 | Bajo Warwick    |  modelo sk4          |            2
          13 | Bajo Warwick    |  modelo sk4          |            3
          14 | Bajo Musicman   |  modelo jazz         |            2
          15 | Bajo Musicman   |  modelo jazz         |            1
          16 | Bateria Noodle  |  modelo f-300        |            4
          17 | Bateria insect  |  modelo f-400        |            5
(9 rows)

