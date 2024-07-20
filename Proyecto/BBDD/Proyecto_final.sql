
CREATE DATABASE Proyecto_Final;
USE Proyecto_Final;

CREATE TABLE CATEGORIAS
(ID_CATEGORIA INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
NOMBRE VARCHAR(45) NOT NULL,
DESCRIPCION VARCHAR(200)
);

INSERT INTO `CATEGORIAS` (`ID_CATEGORIA`,`NOMBRE`,`DESCRIPCION`) values (1, 'Verduras', 'Todo tipo de verduras y hortalizas');
INSERT INTO `CATEGORIAS` (`ID_CATEGORIA`,`NOMBRE`,`DESCRIPCION`) values (2, 'Fruta', 'Tipos de fruta de todo el mundo');
INSERT INTO `CATEGORIAS` (`ID_CATEGORIA`,`NOMBRE`,`DESCRIPCION`) values (3, 'Productos Varios', 'Productos varios de Km 0');


CREATE TABLE PROVEEDOR 
(ID_PROVEEDOR INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
NOMBRE VARCHAR(100),
POBLACION VARCHAR(100),
CALLE VARCHAR(100),
NUMERO INT,
CP INT,
EMAIL VARCHAR(100),
TELEFONO INT,
FECHA_ALTA DATE,
ESTADO VARCHAR(50) -- CAMPO QUE UTILIZAREMOS PARA OCULTAR O MOSTRAR EL OBJETO A = ACTIVADO, D = DESACTIVADO
);

INSERT INTO `PROVEEDOR`(`ID_PROVEEDOR`, `NOMBRE`, `POBLACION`, `CALLE`, `NUMERO`, `CP`, `EMAIL`, `TELEFONO`, `FECHA_ALTA`, `ESTADO`) VALUES (1, 'Verduras Madrid', 'Madrid', 'Pol.Industrial Guadalajara', 101, 28001, 'VerduraMadrid@info.com', 914587236, '2024-03-18', 'a');
INSERT INTO `PROVEEDOR`(`ID_PROVEEDOR`, `NOMBRE`, `POBLACION`, `CALLE`, `NUMERO`, `CP`, `EMAIL`, `TELEFONO`, `FECHA_ALTA`, `ESTADO`) VALUES (2, 'Frutas López', 'Leganés', 'Pol.Industrial Leganés', 130, 28910, 'FrutasLopez@info.com', 658123547, '2024-03-18', 'a');
INSERT INTO `PROVEEDOR`(`ID_PROVEEDOR`, `NOMBRE`, `POBLACION`, `CALLE`, `NUMERO`, `CP`, `EMAIL`, `TELEFONO`, `FECHA_ALTA`, `ESTADO`) VALUES (3, 'Variedades Juan', 'Tres Cantos', 'Pol.Industrial Tres Cantos', 50, 28760, 'VariedadesJuan@info.com', 624852145, '2024-03-18', 'a');

CREATE TABLE PRODUCTOS
(ID_PRODUCTO INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
NOMBRE VARCHAR(50) NOT NULL,
DESCRIPCION VARCHAR(1000),
IMAGEN VARCHAR(200),
IMAGEN_DETALLE VARCHAR(200),
ESTADO VARCHAR(20),-- ESTE ESTADO "A" = ACTIVO , "D" = DESACTIVADO,  ES PARA DISCRIMINAR DE LOS PRODUCTOS QUE TENEMOS EN LA TIENDA -- 
PROMOCION VARCHAR(20), -- ESTÉ PROMOCIÓN "S" = SI, "N" = NO, PARA DIFERENCIAR DE LOS PRODUCTOS QUE ESTAN DE PROMOCIÓN Y LOS QUE NO
DESCUENTO DOUBLE (9,2),
VALORACION VARCHAR (20), -- VALORACIÓN QUE PONE EL EMPRESARIO EN SU PRODUCTO 
CANTIDAD_MAXIMA INT, -- CANTIDAD MÁXIMA DE CADA PRODUCTO QUE HAY EN LA TIENDA --
PRECIO_UNITARIO DOUBLE(9,2),
TIPO_PRODUCTO VARCHAR(100),
ID_CATEGORIA INT NOT NULL,
ID_PROVEEDOR INT NOT NULL,
FOREIGN KEY(ID_CATEGORIA) REFERENCES CATEGORIAS(ID_CATEGORIA),
FOREIGN KEY(ID_PROVEEDOR) REFERENCES PROVEEDOR(ID_PROVEEDOR)
);

INSERT INTO `PRODUCTOS` (`ID_PRODUCTO`, `NOMBRE`, `DESCRIPCION`, `IMAGEN`, `IMAGEN_DETALLE`, `ESTADO`, `PROMOCION`, `DESCUENTO`, `VALORACION`, `CANTIDAD_MAXIMA`, `PRECIO_UNITARIO`,`TIPO_PRODUCTO`, `ID_CATEGORIA`, `ID_PROVEEDOR`) VALUES (1, 'Mandarina', 'Peso medio por unidad: 120 gramos. Calorías: 40. Vitaminas principales: C y fibra. Almacenamiento: ambiente/nevera. Caducidad tras la compra: 7 días', '/css/imagenes/Productos/mandarina.png', '/css/imagenes/Productos/mandarinas_detalle.png', 'a', 's', '2', '9', 300, 0.30,'Mandarina', 2, 2);
INSERT INTO `PRODUCTOS` (`ID_PRODUCTO`, `NOMBRE`, `DESCRIPCION`, `IMAGEN`, `IMAGEN_DETALLE`, `ESTADO`, `PROMOCION`, `DESCUENTO`, `VALORACION`, `CANTIDAD_MAXIMA`, `PRECIO_UNITARIO`,`TIPO_PRODUCTO`, `ID_CATEGORIA`, `ID_PROVEEDOR`) VALUES (2, 'Manzana Roja', 'Peso medio por unidad: 175 gramos. Calorías: 95. Vitaminas principales: C y fibra. Almacenamiento: ambiente/nevera. Caducidad tras la compra: 7 días', '/css/imagenes/Productos/manzanaRoja.png', '/css/imagenes/Productos/manzanas_detalle.png',  'a', 'n', '0', '8',500, 0.40,'Manzana', 2, 2);
INSERT INTO `PRODUCTOS` (`ID_PRODUCTO`, `NOMBRE`, `DESCRIPCION`, `IMAGEN`, `IMAGEN_DETALLE`, `ESTADO`, `PROMOCION`, `DESCUENTO`, `VALORACION`, `CANTIDAD_MAXIMA`, `PRECIO_UNITARIO`,`TIPO_PRODUCTO`, `ID_CATEGORIA`, `ID_PROVEEDOR`) VALUES (3, 'Plátano de Canarias', 'Peso medio por unidad: 118 gramos. Calorías: 105. Vitaminas principales: A ,B6 y C. Almacenamiento: ambiente/nevera. Caducidad tras la compra: 5 días', '/css/imagenes/Productos/platano.png', '/css/imagenes/Productos/platanos_detalle.png', 'a', 'n', '0', '8.5', 600, 0.50,'Platano', 2, 2);
INSERT INTO `PRODUCTOS` (`ID_PRODUCTO`, `NOMBRE`, `DESCRIPCION`, `IMAGEN`, `IMAGEN_DETALLE`, `ESTADO`, `PROMOCION`, `DESCUENTO`, `VALORACION`, `CANTIDAD_MAXIMA`, `PRECIO_UNITARIO`,`TIPO_PRODUCTO`, `ID_CATEGORIA`, `ID_PROVEEDOR`) VALUES (4, 'Granada Roja', 'Peso medio por unidad: 200 gramos. Calorías: 120. Vitaminas principales: C, K y folato. Almacenamiento: nevera. Caducidad tras la compra: 14 días', '/css/imagenes/Productos/granada_tarjeta.png', '/css/imagenes/Productos/granadas_detalle.png', 'a', 'n', '0', '7', 200, 1.90,'Granada', 2, 2);
INSERT INTO `PRODUCTOS` (`ID_PRODUCTO`, `NOMBRE`, `DESCRIPCION`, `IMAGEN`, `IMAGEN_DETALLE`, `ESTADO`, `PROMOCION`, `DESCUENTO`, `VALORACION`, `CANTIDAD_MAXIMA`, `PRECIO_UNITARIO`,`TIPO_PRODUCTO`, `ID_CATEGORIA`, `ID_PROVEEDOR`) VALUES (5, 'Pera Conferencia', 'Peso medio por unidad: 175 gramos. Calorías: 100. Vitaminas principales: C y fibra. Almacenamiento: ambiente/nevera. Caducidad tras la compra: 7 días',  '/css/imagenes/Productos/Pera.png', '/css/imagenes/Productos/peras_detalle.png', 'a', 'n', '0', '8.5',400, 0.80,'Pera', 2, 2);
INSERT INTO `PRODUCTOS` (`ID_PRODUCTO`, `NOMBRE`, `DESCRIPCION`, `IMAGEN`, `IMAGEN_DETALLE`, `ESTADO`, `PROMOCION`, `DESCUENTO`, `VALORACION`, `CANTIDAD_MAXIMA`, `PRECIO_UNITARIO`,`TIPO_PRODUCTO`, `ID_CATEGORIA`, `ID_PROVEEDOR`) VALUES (6, 'Mango', 'Peso medio por unidad: 88 gramos. Calorías: 42. Vitaminas principales: C, E y K. Almacenamiento: ambiente/nevera. Caducidad tras la compra: 15 días', '/css/imagenes/Productos/Mango.png', '/css/imagenes/Productos/mango_detalle.png',  'a', 'n', '0', '8', 200, 2.40,'Mango', 2, 2);
INSERT INTO `PRODUCTOS` (`ID_PRODUCTO`, `NOMBRE`, `DESCRIPCION`, `IMAGEN`, `IMAGEN_DETALLE`, `ESTADO`, `PROMOCION`, `DESCUENTO`, `VALORACION`, `CANTIDAD_MAXIMA`, `PRECIO_UNITARIO`,`TIPO_PRODUCTO`, `ID_CATEGORIA`, `ID_PROVEEDOR`) VALUES (7, 'Melocotón Amarillo', 'Peso medio por unidad: 175 gramos. Calorías: 60. Vitaminas principales: A, C y fibra. Almacenamiento: ambiente/nevera. Caducidad tras la compra: 7 días', '/css/imagenes/Productos/melocoton.png', '/css/imagenes/Productos/melocotones_detalle.png', 'a', 'n', '0', '7', 800, 0.40,'Melocoton', 2, 2);
INSERT INTO `PRODUCTOS` (`ID_PRODUCTO`, `NOMBRE`, `DESCRIPCION`, `IMAGEN`, `IMAGEN_DETALLE`, `ESTADO`, `PROMOCION`, `DESCUENTO`, `VALORACION`, `CANTIDAD_MAXIMA`, `PRECIO_UNITARIO`,`TIPO_PRODUCTO`, `ID_CATEGORIA`, `ID_PROVEEDOR`) VALUES (8, 'Ciruela', 'Peso medio por unidad: 40 gramos. Calorías: 475. Vitaminas principales: C y K. Almacenamiento: ambiente/nevera. Caducidad tras la compra: 6 días', '/css/imagenes/Productos/ciruela_tarjeta.png', '/css/imagenes/Productos/ciruelas_detalle.png', 'a', 'n', '0', '6', 500, 0.80,'Ciruela', 2, 2);
INSERT INTO `PRODUCTOS` (`ID_PRODUCTO`, `NOMBRE`, `DESCRIPCION`, `IMAGEN`, `IMAGEN_DETALLE`, `ESTADO`, `PROMOCION`, `DESCUENTO`, `VALORACION`, `CANTIDAD_MAXIMA`, `PRECIO_UNITARIO`,`TIPO_PRODUCTO`, `ID_CATEGORIA`, `ID_PROVEEDOR`) VALUES (9, 'Uva', 'Peso medio por racimo: 250 gramos. Calorías: 190. Vitaminas principales: C y K. Almacenamiento: nevera. Caducidad tras la compra: 9 días', '/css/imagenes/Productos/uva.png', '/css/imagenes/Productos/uvas_detalle.png', 'd', 'n', '0', '8', 600, 0.90,'Uva', 2, 2);
INSERT INTO `PRODUCTOS` (`ID_PRODUCTO`, `NOMBRE`, `DESCRIPCION`, `IMAGEN`, `IMAGEN_DETALLE`, `ESTADO`, `PROMOCION`, `DESCUENTO`, `VALORACION`, `CANTIDAD_MAXIMA`, `PRECIO_UNITARIO`,`TIPO_PRODUCTO`, `ID_CATEGORIA`, `ID_PROVEEDOR`) VALUES (10, 'Acelga', 'Peso medio por unidad: 340 gramos. Calorías: 60. Vitaminas principales: A, C y K. Almacenamiento: nevera. Caducidad tras la compra: 7 días', '/css/imagenes/Productos/Acelga.png', '/css/imagenes/Productos/acelgas_detalle.png', 'a', 's', '2', '9', 800, 0.60,'Acelga', 1, 1);
INSERT INTO `PRODUCTOS` (`ID_PRODUCTO`, `NOMBRE`, `DESCRIPCION`, `IMAGEN`, `IMAGEN_DETALLE`, `ESTADO`, `PROMOCION`, `DESCUENTO`, `VALORACION`, `CANTIDAD_MAXIMA`, `PRECIO_UNITARIO`,`TIPO_PRODUCTO`, `ID_CATEGORIA`, `ID_PROVEEDOR`) VALUES (11, 'Apio', 'Peso medio por unidad: 40 gramos. Calorías: 5. Vitaminas principales: C y K. Almacenamiento: nevera. Caducidad tras la compra: 5 días', '/css/imagenes/Productos/apio.png', '/css/imagenes/Productos/apio_detalle.png', 'a', 'n', '0', '8', 300, 0.90,'Apio', 1, 1);
INSERT INTO `PRODUCTOS` (`ID_PRODUCTO`, `NOMBRE`, `DESCRIPCION`, `IMAGEN`, `IMAGEN_DETALLE`, `ESTADO`, `PROMOCION`, `DESCUENTO`, `VALORACION`, `CANTIDAD_MAXIMA`, `PRECIO_UNITARIO`,`TIPO_PRODUCTO`, `ID_CATEGORIA`, `ID_PROVEEDOR`) VALUES (12, 'Calabaza', 'Peso medio por unidad: 2000 gramos. Calorías: 400. Vitaminas principales: A, C y potasio. Almacenamiento: ambiente/nevera. Caducidad tras la compra: 7 días', '/css/imagenes/Productos/calabaza.png', '/css/imagenes/Productos/calabazas_detalle.png', 'a', 'n', '0', '7.5', 500, 1.90,'Calabaza', 1, 1);
INSERT INTO `PRODUCTOS` (`ID_PRODUCTO`, `NOMBRE`, `DESCRIPCION`, `IMAGEN`, `IMAGEN_DETALLE`, `ESTADO`, `PROMOCION`, `DESCUENTO`, `VALORACION`, `CANTIDAD_MAXIMA`, `PRECIO_UNITARIO`,`TIPO_PRODUCTO`, `ID_CATEGORIA`, `ID_PROVEEDOR`) VALUES (13, 'Patata', 'Peso medio por unidad: 150 gramos. Calorías: 110. Vitaminas principales: C y B6. Almacenamiento: ambiente. Caducidad tras la compra: 30 días', '/css/imagenes/Productos/patata_tarjeta.png', '/css/imagenes/Productos/patata_detalle.png', 'a', 'n', '0', '7', 600, 0.40,'Patata', 1, 1);
INSERT INTO `PRODUCTOS` (`ID_PRODUCTO`, `NOMBRE`, `DESCRIPCION`, `IMAGEN`, `IMAGEN_DETALLE`, `ESTADO`, `PROMOCION`, `DESCUENTO`, `VALORACION`, `CANTIDAD_MAXIMA`, `PRECIO_UNITARIO`,`TIPO_PRODUCTO`, `ID_CATEGORIA`, `ID_PROVEEDOR`) VALUES (14, 'Puerro', 'Peso medio por unidad: 175 gramos. Calorías: 26. Vitaminas principales: A, B y C. Almacenamiento: nevera. Caducidad tras la compra: 12 días', '/css/imagenes/Productos/Puerro.png', '/css/imagenes/Productos/puerros_detalle.png',  'a', 'n', '0', '6', 200, 0.30,'Puerro', 1, 1);
INSERT INTO `PRODUCTOS` (`ID_PRODUCTO`, `NOMBRE`, `DESCRIPCION`, `IMAGEN`, `IMAGEN_DETALLE`, `ESTADO`, `PROMOCION`, `DESCUENTO`, `VALORACION`, `CANTIDAD_MAXIMA`, `PRECIO_UNITARIO`,`TIPO_PRODUCTO`, `ID_CATEGORIA`, `ID_PROVEEDOR`) VALUES (15, 'Cebolla', 'Peso medio por unidad: 250 gramos. Calorías: 16. Vitaminas principales: C y K. Almacenamiento: nevera. Caducidad tras la compra: 6 días', '/css/imagenes/Productos/cebolla.png', '/css/imagenes/Productos/cebollas_detalle.png', 'a', 'n', '0', '7.5', 400, 0.30,'Cebolla', 1, 1);
INSERT INTO `PRODUCTOS` (`ID_PRODUCTO`, `NOMBRE`, `DESCRIPCION`, `IMAGEN`, `IMAGEN_DETALLE`, `ESTADO`, `PROMOCION`, `DESCUENTO`, `VALORACION`, `CANTIDAD_MAXIMA`, `PRECIO_UNITARIO`,`TIPO_PRODUCTO`, `ID_CATEGORIA`, `ID_PROVEEDOR`) VALUES (16, 'Zanahoria', 'Peso medio por unidad: 60 gramos. Calorías: 27. Vitaminas principales: A, B y K. Almacenamiento: nevera. Caducidad tras la compra: 22 días', '/css/imagenes/Productos/Zanahoria.png', '/css/imagenes/Productos/zanahorias_detalle.png', 'a', 'n', '0', '7', 200, 0.30,'Zanahoria', 1, 1);
INSERT INTO `PRODUCTOS` (`ID_PRODUCTO`, `NOMBRE`, `DESCRIPCION`, `IMAGEN`, `IMAGEN_DETALLE`, `ESTADO`, `PROMOCION`, `DESCUENTO`, `VALORACION`, `CANTIDAD_MAXIMA`, `PRECIO_UNITARIO`,`TIPO_PRODUCTO`, `ID_CATEGORIA`, `ID_PROVEEDOR`) VALUES (17, 'Tomate', 'Peso medio por unidad: 175 gramos. Calorías: 22. Vitaminas principales: A, C y K. Almacenamiento: ambiente. Caducidad tras la compra: 6 días', '/css/imagenes/Productos/tomate.png', '/css/imagenes/Productos/tomates_detalle.png', 'a', 'n', '0', '8', 800, 1.00,'Tomate', 1, 1);
INSERT INTO `PRODUCTOS` (`ID_PRODUCTO`, `NOMBRE`, `DESCRIPCION`, `IMAGEN`, `IMAGEN_DETALLE`, `ESTADO`, `PROMOCION`, `DESCUENTO`, `VALORACION`, `CANTIDAD_MAXIMA`, `PRECIO_UNITARIO`,`TIPO_PRODUCTO`, `ID_CATEGORIA`, `ID_PROVEEDOR`) VALUES (18, 'Colifor', 'Peso medio por unidad: 750 gramos. Calorías: 220. Vitaminas principales: C, K y folato. Almacenamiento: nevera. Caducidad tras la compra: 6 días', '/css/imagenes/Productos/coliflor.png', '/css/imagenes/Productos/coliflores_detalle.png', 'a', 'n', '0', '7.5', 500, 3.80,'Coliflor', 1, 1);
INSERT INTO `PRODUCTOS` (`ID_PRODUCTO`, `NOMBRE`, `DESCRIPCION`, `IMAGEN`, `IMAGEN_DETALLE`, `ESTADO`, `PROMOCION`, `DESCUENTO`, `VALORACION`, `CANTIDAD_MAXIMA`, `PRECIO_UNITARIO`,`TIPO_PRODUCTO`, `ID_CATEGORIA`, `ID_PROVEEDOR`) VALUES (19, 'Calabacín', 'Peso medio por unidad: 350 gramos. Calorías: 33. Vitaminas principales: B6 y C. Almacenamiento: nevera. Caducidad tras la compra: 12 días', '/css/imagenes/Productos/calabacin.png', '/css/imagenes/Productos/calabacines_detalle.png', 'a', 'n', '0', '7', 600, 0.50,'Calabacin', 1, 1);
INSERT INTO `PRODUCTOS` (`ID_PRODUCTO`, `NOMBRE`, `DESCRIPCION`, `IMAGEN`, `IMAGEN_DETALLE`, `ESTADO`, `PROMOCION`, `DESCUENTO`, `VALORACION`, `CANTIDAD_MAXIMA`, `PRECIO_UNITARIO`,`TIPO_PRODUCTO`, `ID_CATEGORIA`, `ID_PROVEEDOR`) VALUES (20, 'Berenjena', 'Peso medio por unidad: 250 gramos. Calorías: 23. Vitaminas principales: B1, B6 y fibra. Almacenamiento: nevera. Caducidad tras la compra: 6 días', '/css/imagenes/Productos/berenjena.png', '/css/imagenes/Productos/berenjenas_detalle.png', 'd', 'n', '0', '8.5', 800, 0.90,'Berenjena', 1, 1);
INSERT INTO `PRODUCTOS` (`ID_PRODUCTO`, `NOMBRE`, `DESCRIPCION`, `IMAGEN`, `IMAGEN_DETALLE`, `ESTADO`, `PROMOCION`, `DESCUENTO`, `VALORACION`, `CANTIDAD_MAXIMA`, `PRECIO_UNITARIO`,`TIPO_PRODUCTO`, `ID_CATEGORIA`, `ID_PROVEEDOR`) VALUES (21, 'Queso Grana Padano', 'Peso medio por unidad: 1000 gramos. Calorías: 3800. Vitaminas principales: A y D. Almacenamiento: nevera. Caducidad tras la compra: 180 días', '/css/imagenes/Productos/QuesoPadano.png', '/css/imagenes/Productos/quesos_detalle.png', 'a', 's', '2', '6', 800, 3.00,'Queso', 3, 3);
INSERT INTO `PRODUCTOS` (`ID_PRODUCTO`, `NOMBRE`, `DESCRIPCION`, `IMAGEN`, `IMAGEN_DETALLE`, `ESTADO`, `PROMOCION`, `DESCUENTO`, `VALORACION`, `CANTIDAD_MAXIMA`, `PRECIO_UNITARIO`,`TIPO_PRODUCTO`, `ID_CATEGORIA`, `ID_PROVEEDOR`) VALUES (22, 'Leche Asturiana', 'Peso medio por unidad: 1000 gramos. Calorías: 650. Vitaminas principales: B12 y D. Almacenamiento: nevera. Caducidad tras la compra: 5 días', '/css/imagenes/Productos/asturiana.png', '/css/imagenes/Productos/leche_detalle.png', 'a', 'n', '0', '7', 300, 1.40,'Leche', 3, 3);
INSERT INTO `PRODUCTOS` (`ID_PRODUCTO`, `NOMBRE`, `DESCRIPCION`, `IMAGEN`, `IMAGEN_DETALLE`, `ESTADO`, `PROMOCION`, `DESCUENTO`, `VALORACION`, `CANTIDAD_MAXIMA`, `PRECIO_UNITARIO`,`TIPO_PRODUCTO`, `ID_CATEGORIA`, `ID_PROVEEDOR`) VALUES (23, 'Arroz de Pals', 'Peso medio por unidad: 750 gramos. Calorías: 1600. Vitaminas principales: B1 y B3. Almacenamiento: ambiente. Caducidad tras la compra: 700 días', '/css/imagenes/Productos/Arros.png', '/css/imagenes/Productos/arroz_detalle.png', 'a', 'n', '0', '7', 500, 3.80,'Arroz', 3, 3);
INSERT INTO `PRODUCTOS` (`ID_PRODUCTO`, `NOMBRE`, `DESCRIPCION`, `IMAGEN`, `IMAGEN_DETALLE`, `ESTADO`, `PROMOCION`, `DESCUENTO`, `VALORACION`, `CANTIDAD_MAXIMA`, `PRECIO_UNITARIO`,`TIPO_PRODUCTO`, `ID_CATEGORIA`, `ID_PROVEEDOR`) VALUES (24, 'Jamón Serrano', 'Peso medio por unidad: 1000 gramos. Calorías: 2000. Vitaminas principales: B1, B2 y B3. Almacenamiento: ambiente/nevera. Caducidad tras la compra: 30 días', '/css/imagenes/Productos/jamon.png', '/css/imagenes/Productos/serrano_detalle.png', 'a', 'n', '0', '6.5', 600, 6.80,'JamonS', 3, 3);
INSERT INTO `PRODUCTOS` (`ID_PRODUCTO`, `NOMBRE`, `DESCRIPCION`, `IMAGEN`, `IMAGEN_DETALLE`, `ESTADO`, `PROMOCION`, `DESCUENTO`, `VALORACION`, `CANTIDAD_MAXIMA`, `PRECIO_UNITARIO`,`TIPO_PRODUCTO`, `ID_CATEGORIA`, `ID_PROVEEDOR`) VALUES (25, 'Jamón York', 'Peso medio por unidad: 1000 gramos. Calorías: 1000. Vitaminas principales: B3 y B12. Almacenamiento: nevera. Caducidad tras la compra: 8 días', '/css/imagenes/Productos/jamonYork.png', '/css/imagenes/Productos/york_detalle.png', 'a', 'n', '0', '8', 200, 2.00,'JamonY', 3, 3);
INSERT INTO `PRODUCTOS` (`ID_PRODUCTO`, `NOMBRE`, `DESCRIPCION`, `IMAGEN`, `IMAGEN_DETALLE`, `ESTADO`, `PROMOCION`, `DESCUENTO`, `VALORACION`, `CANTIDAD_MAXIMA`, `PRECIO_UNITARIO`,`TIPO_PRODUCTO`, `ID_CATEGORIA`, `ID_PROVEEDOR`) VALUES (26, 'Pasta Barilla', 'Peso medio por unidad: 1000 gramos. Calorías: 3500. Vitaminas principales: carbohidratos. Almacenamiento: ambiente. Caducidad tras la compra: 365 días', '/css/imagenes/Productos/pastaBarilla.png', '/css/imagenes/Productos/pasta_detalle.png', 'a', 'n', '0', '6.5', 400, 2.00,'Pasta', 3, 3);
INSERT INTO `PRODUCTOS` (`ID_PRODUCTO`, `NOMBRE`, `DESCRIPCION`, `IMAGEN`, `IMAGEN_DETALLE`, `ESTADO`, `PROMOCION`, `DESCUENTO`, `VALORACION`, `CANTIDAD_MAXIMA`, `PRECIO_UNITARIO`,`TIPO_PRODUCTO`, `ID_CATEGORIA`, `ID_PROVEEDOR`) VALUES (27, 'Miel', 'Peso medio por unidad: 500 gramos. Calorías: 1524. Vitaminas principales: B y C. Almacenamiento: ambiente. Caducidad tras la compra: 180 días', '/css/imagenes/Productos/Miel.png', '/css/imagenes/Productos/miel_detalle.png', 'a', 'n', '0', '7.5', 200, 6.90,'Miel', 3, 3);
INSERT INTO `PRODUCTOS` (`ID_PRODUCTO`, `NOMBRE`, `DESCRIPCION`, `IMAGEN`, `IMAGEN_DETALLE`, `ESTADO`, `PROMOCION`, `DESCUENTO`, `VALORACION`, `CANTIDAD_MAXIMA`, `PRECIO_UNITARIO`,`TIPO_PRODUCTO`, `ID_CATEGORIA`, `ID_PROVEEDOR`) VALUES (28, 'Nueces', 'Peso medio por unidad: 500 gramos. Calorías: 3000. Vitaminas principales: Omega-3 y Omega-6. Almacenamiento: ambiente. Caducidad tras la compra: 365 días', '/css/imagenes/Productos/nueces_tarjeta.png', '/css/imagenes/Productos/nueces_detalle.png', 'a', 'n', '0', '7.5', 800, 0.10,'Nuez', 3, 3);
INSERT INTO `PRODUCTOS` (`ID_PRODUCTO`, `NOMBRE`, `DESCRIPCION`, `IMAGEN`, `IMAGEN_DETALLE`, `ESTADO`, `PROMOCION`, `DESCUENTO`, `VALORACION`, `CANTIDAD_MAXIMA`, `PRECIO_UNITARIO`,`TIPO_PRODUCTO`, `ID_CATEGORIA`, `ID_PROVEEDOR`) VALUES (29, 'Almendras', 'Peso medio por unidad: 200 gramos. Calorías: 1100. Vitaminas principales: E y magnesio. Almacenamiento: ambiente. Caducidad tras la compra: 700 días', '/css/imagenes/Productos/almendras_tarjeta.png', '/css/imagenes/Productos/almendras_detalle.png', 'a', 'n', '0', '9', 500, 0.30,'Almendra', 3, 3);
INSERT INTO `PRODUCTOS` (`ID_PRODUCTO`, `NOMBRE`, `DESCRIPCION`, `IMAGEN`, `IMAGEN_DETALLE`, `ESTADO`, `PROMOCION`, `DESCUENTO`, `VALORACION`, `CANTIDAD_MAXIMA`, `PRECIO_UNITARIO`,`TIPO_PRODUCTO`, `ID_CATEGORIA`, `ID_PROVEEDOR`) VALUES (30, 'Cacahuetes', 'Peso medio por unidad: 500 gramos. Calorías: 1150. Vitaminas principales: hierro y potasio. Almacenamiento: ambiente. Caducidad tras la compra: 365 días', '/css/imagenes/Productos/cacahuetes_tarjeta.png', '/css/imagenes/Productos/cacahuetes_detalle.png', 'd', 'n', '0', '8.5', 600, 0.15,'Cacahuete', 3, 3);

CREATE TABLE USUARIOS
(
USERNAME VARCHAR(45) NOT NULL PRIMARY KEY,
PASSWORD VARCHAR(200) NOT NULL,
NOMBRE VARCHAR(50),
PRIMER_APELLIDO VARCHAR(50),
SEGUNDO_APELLIDO VARCHAR(50),
TELEFONO VARCHAR(50),
SEXO VARCHAR(20), -- PARA GENERO "H"= HOMBRE, "M"= MUJER
EMAIL VARCHAR(100),
FOTO VARCHAR(200),
ESTADO INT NOT NULL DEFAULT 1, -- ESTE ESTADO "1"= ACTIVO , "0"= DESACTIVADO, PARA CONTROLAR LOS USUARIOS QUE TENEMOS ACTIVOS--
FECHA_REGISTRO DATE,
FECHA_NACIMIENTO DATE,
MIS_PUNTOS DOUBLE (9,2),
ARCHIVO_FAMILIA VARCHAR(100)
);

INSERT INTO `USUARIOS` (`USERNAME`,`PASSWORD`,`NOMBRE`,`PRIMER_APELLIDO`,`SEGUNDO_APELLIDO`,`TELEFONO`, `SEXO`, `EMAIL`,`FOTO`,`ESTADO`,`FECHA_REGISTRO`, `FECHA_NACIMIENTO`, `MIS_PUNTOS`, `ARCHIVO_FAMILIA`) VALUES ('Geri','{noop}geri','Gerard','Perujo','Buxeda', '651258741' , 'h','ger.pe85@gmail.com','null',1,'2024-03-14', '1985-04-08', 300, null);
INSERT INTO `USUARIOS` (`USERNAME`,`PASSWORD`,`NOMBRE`,`PRIMER_APELLIDO`,`SEGUNDO_APELLIDO`,`TELEFONO`, `SEXO`, `EMAIL`,`FOTO`,`ESTADO`,`FECHA_REGISTRO`, `FECHA_NACIMIENTO`, `MIS_PUNTOS`, `ARCHIVO_FAMILIA`) VALUES ('Mari','{noop}mari','Maria','Isabel','Martín', '698521477', 'm', 'mar.Isab@gmail.com','null',1,'2024-03-14', '2005-06-11', 255, null);
INSERT INTO `USUARIOS` (`USERNAME`,`PASSWORD`,`NOMBRE`,`PRIMER_APELLIDO`,`SEGUNDO_APELLIDO`,`TELEFONO`, `SEXO`, `EMAIL`,`FOTO`,`ESTADO`,`FECHA_REGISTRO`, `FECHA_NACIMIENTO`, `MIS_PUNTOS`, `ARCHIVO_FAMILIA`) VALUES ('Noeli','{noop}noeli','Noelia','Villahermosa','Garcia', '651489751', 'm', 'noe.villa@gmail.com','null',1,'2024-03-14', '2003-10-20', 555, null);
INSERT INTO `USUARIOS` (`USERNAME`,`PASSWORD`,`NOMBRE`,`PRIMER_APELLIDO`,`SEGUNDO_APELLIDO`,`TELEFONO`, `SEXO`, `EMAIL`,`FOTO`,`ESTADO`,`FECHA_REGISTRO`, `FECHA_NACIMIENTO`, `MIS_PUNTOS`, `ARCHIVO_FAMILIA`) VALUES ('Pepin','{noop}pepin','Pepe','Garcia','Romero', '651489765', 'h', 'pep.gar@gmail.com','null',1,'2024-05-14', '1975-10-20', 0.00, null);


CREATE TABLE PRODUCTOS_FAVORITOS
(ID_FAVORITO INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
NOMBRE VARCHAR(200),
IMAGEN VARCHAR(200),
PRECIO DOUBLE (9,2),
VALORACION VARCHAR (20),
ESTADO VARCHAR(50), -- CAMPO QUE UTILIZAREMOS PARA OCULTAR O MOSTRAR EL OBJETO A = ACTIVADO, D = DESACTIVADO
ID_PRODUCTO INT,
USERNAME VARCHAR(100),
FOREIGN KEY (ID_PRODUCTO) REFERENCES PRODUCTOS (ID_PRODUCTO),
FOREIGN KEY (USERNAME) REFERENCES USUARIOS (USERNAME)
);
INSERT INTO `PRODUCTOS_FAVORITOS` (`ID_FAVORITO`,`NOMBRE`,`IMAGEN`,`PRECIO`,`VALORACION`,`ESTADO`, `ID_PRODUCTO`, `USERNAME`) VALUES (1,'Mandarina','/css/imagenes/Productos/mandarina.png','0.30', '9/10', 'a', '1','Geri');
INSERT INTO `PRODUCTOS_FAVORITOS` (`ID_FAVORITO`,`NOMBRE`,`IMAGEN`,`PRECIO`,`VALORACION`,`ESTADO`, `ID_PRODUCTO`, `USERNAME`) VALUES (2,'Manzana Roja','/css/imagenes/Productos/manzanaRoja.png','0.40', '8/10', 'a', '2','Geri');


CREATE TABLE EMPRESA
(ID_EMPRESA INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
NOMBRE VARCHAR(100),
POBLACION VARCHAR(100),
CALLE VARCHAR(100),
NUMERO INT,
CP INT,
EMAIL VARCHAR(100),
TELEFONO VARCHAR(50),
FECHA_ALTA DATE
);

INSERT INTO `EMPRESA`(`ID_EMPRESA`,`NOMBRE`,`POBLACION`,`CALLE`,`NUMERO`,`CP`,`EMAIL`, `TELEFONO`, `FECHA_ALTA`) VALUES (1,'FrutasYVerdurasPeco','Madrid','Calle Atocha', 120, 28001, 'pecoverdurasinfo@gmail.com', '658412369', '2024-03-18');
 
 CREATE TABLE CUENTA_EMPRESA
(ID_CUENTA INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
NOMBRE VARCHAR(100),
NUMERO_CUENTA VARCHAR(100),
SALDO DOUBLE(9,2),
ID_EMPRESA INT,
FOREIGN KEY (ID_EMPRESA) REFERENCES EMPRESA(ID_EMPRESA)
);

INSERT INTO `CUENTA_EMPRESA`(`ID_CUENTA`, `NOMBRE`, `NUMERO_CUENTA`, `SALDO`, `ID_EMPRESA`) VALUES (1, 'Banco Santander', 'ES65-2100-10-0000126589', 50000, 1);

 
CREATE TABLE PEDIDOS
(ID_PEDIDO INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
FECHA_PEDIDO DATE,
TOTAL DOUBLE(9,2), -- PRECIO TOTAL DEL PEDIDO CON TODOS LOS PRODUCTOS --
ESTADO VARCHAR(100), -- ESTE ESTADO "A"= AÚN NO SE HA COMPRADO , "D" = YA SE HA COMPRADO,  ES PARA DISCRIMINAR DE LOS ELEMENTOS COMPRADOS A LOS QUE FALTAN POR COMPRAR--
ID_EMPRESA INT,
PUNTOS_CONSEGIDOS DOUBLE(9,2),
USERNAME VARCHAR(45),
FOREIGN KEY (USERNAME) REFERENCES USUARIOS(USERNAME),
FOREIGN KEY (ID_EMPRESA) REFERENCES EMPRESA(ID_EMPRESA)
);

INSERT INTO `PEDIDOS`(`ID_PEDIDO`, `FECHA_PEDIDO`, `TOTAL`, `ESTADO`, `ID_EMPRESA`, `PUNTOS_CONSEGIDOS`, `USERNAME`) VALUES (1, '2024-03-15', 20.5, 'd', 1, 12.5, 'Geri');
INSERT INTO `PEDIDOS`(`ID_PEDIDO`, `FECHA_PEDIDO`, `TOTAL`, `ESTADO`, `ID_EMPRESA`, `PUNTOS_CONSEGIDOS`, `USERNAME`) VALUES (2, '2024-03-20', 20.5, 'd', 1, 20, 'Geri');
INSERT INTO `PEDIDOS`(`ID_PEDIDO`, `FECHA_PEDIDO`, `TOTAL`, `ESTADO`, `ID_EMPRESA`, `PUNTOS_CONSEGIDOS`, `USERNAME`) VALUES (3, '2024-04-08', 20.5, 'd', 1, 6.5, 'Geri');
INSERT INTO `PEDIDOS`(`ID_PEDIDO`, `FECHA_PEDIDO`, `TOTAL`, `ESTADO`, `ID_EMPRESA`, `PUNTOS_CONSEGIDOS`, `USERNAME`) VALUES (4, '2024-04-21', 20.5, 'd', 1, 9.5, 'Geri');



CREATE TABLE PRODUCTO_PEDIDOS
(ID_COMPRA INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
ID_PRODUCTO INT,
ID_PEDIDO INT,
PRECIO_PRODUCTO DOUBLE(9,2), -- PRECIO UNITARIO MÁS LA CANTIDAD QUE DESEAMOS COMPRAR --
CANTIDAD INT, -- CANTIDAD DE CADA PRODUCTO QUE COMPRAMOS --
FOREIGN KEY(ID_PEDIDO) REFERENCES PEDIDOS(ID_PEDIDO),
FOREIGN KEY(ID_PRODUCTO) REFERENCES PRODUCTOS(ID_PRODUCTO)
);
INSERT INTO `PRODUCTO_PEDIDOS`(`ID_COMPRA`, `ID_PRODUCTO`, `ID_PEDIDO`, `PRECIO_PRODUCTO`, `CANTIDAD`) VALUES (1, 4, 1, 20.30, 4);
INSERT INTO `PRODUCTO_PEDIDOS`(`ID_COMPRA`, `ID_PRODUCTO`, `ID_PEDIDO`, `PRECIO_PRODUCTO`, `CANTIDAD`) VALUES (2, 5, 1, 30.30, 2);
INSERT INTO `PRODUCTO_PEDIDOS`(`ID_COMPRA`, `ID_PRODUCTO`, `ID_PEDIDO`, `PRECIO_PRODUCTO`, `CANTIDAD`) VALUES (3, 10, 1, 4.40, 1);
INSERT INTO `PRODUCTO_PEDIDOS`(`ID_COMPRA`, `ID_PRODUCTO`, `ID_PEDIDO`, `PRECIO_PRODUCTO`, `CANTIDAD`) VALUES (4, 12, 2, 51.00, 8);
INSERT INTO `PRODUCTO_PEDIDOS`(`ID_COMPRA`, `ID_PRODUCTO`, `ID_PEDIDO`, `PRECIO_PRODUCTO`, `CANTIDAD`) VALUES (5, 2, 2, 51.00, 8);
INSERT INTO `PRODUCTO_PEDIDOS`(`ID_COMPRA`, `ID_PRODUCTO`, `ID_PEDIDO`, `PRECIO_PRODUCTO`, `CANTIDAD`) VALUES (6, 16, 2, 1.00, 2);
INSERT INTO `PRODUCTO_PEDIDOS`(`ID_COMPRA`, `ID_PRODUCTO`, `ID_PEDIDO`, `PRECIO_PRODUCTO`, `CANTIDAD`) VALUES (7, 20, 3, 1.00, 2);
INSERT INTO `PRODUCTO_PEDIDOS`(`ID_COMPRA`, `ID_PRODUCTO`, `ID_PEDIDO`, `PRECIO_PRODUCTO`, `CANTIDAD`) VALUES (8, 21, 4, 8.10, 1);





-- TABLAS PARA LOGIN, LOGOUT y REGISTRO o  SPRING SECURITY 

CREATE TABLE PERFILES
(ID_PERFIL INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
NOMBRE VARCHAR(45) NOT NULL
);
INSERT INTO `PERFILES` (`ID_PERFIL`,`NOMBRE`) VALUES (1,'ROLE_ADMINISTRADOR');
INSERT INTO `PERFILES` (`ID_PERFIL`,`NOMBRE`) VALUES (2,'ROLE_CLIENTE');
INSERT INTO `PERFILES` (`ID_PERFIL`,`NOMBRE`) VALUES (3,'ROLE_CLIENTEVIP');
INSERT INTO `PERFILES` (`ID_PERFIL`,`NOMBRE`) VALUES (4,'ROLE_FAMILIA');


CREATE TABLE USUARIO_PERFILES
(USERNAME VARCHAR(45) NOT NULL,
ID_PERFIL INT NOT NULL,
PRIMARY KEY(USERNAME, ID_PERFIL),
FOREIGN KEY(USERNAME) REFERENCES USUARIOS(USERNAME),
FOREIGN KEY(ID_PERFIL) REFERENCES PERFILES(ID_PERFIL)
);

INSERT INTO `USUARIO_PERFILES` (`USERNAME`,`ID_PERFIL`) VALUES ('Geri',1);
INSERT INTO `USUARIO_PERFILES` (`USERNAME`,`ID_PERFIL`) VALUES ('Mari',2);
INSERT INTO `USUARIO_PERFILES` (`USERNAME`,`ID_PERFIL`) VALUES ('Noeli',3);
INSERT INTO `USUARIO_PERFILES` (`USERNAME`,`ID_PERFIL`) VALUES ('Pepin',2);


CREATE TABLE COMENTARIOS
(ID_COMENTARIO INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
FECHA DATE,
VALORACION VARCHAR (20),
COMENTARIO VARCHAR(1000),
ID_PRODUCTO INT,
ESTADO VARCHAR(50), -- CAMPO QUE UTILIZAREMOS PARA OCULTAR O MOSTRAR EL OBJETO A = ACTIVADO, D = DESACTIVADO
USERNAME VARCHAR(50),
FOREIGN KEY (ID_PRODUCTO) REFERENCES PRODUCTOS(ID_PRODUCTO),
FOREIGN KEY (USERNAME) REFERENCES USUARIOS(USERNAME)
);

INSERT INTO `COMENTARIOS` (`ID_COMENTARIO`, `FECHA`, `VALORACION`, `COMENTARIO`, `ID_PRODUCTO`, `ESTADO`, `USERNAME`)VALUES (1, '2024-05-11', 9, 'Estas Mandarinas que compré son muy dulces y muy jugosas, recomiendo comprarlas', 1, 'a', 'Geri');
INSERT INTO `COMENTARIOS` (`ID_COMENTARIO`, `FECHA`, `VALORACION`, `COMENTARIO`, `ID_PRODUCTO`, `ESTADO`, `USERNAME` )VALUES (2, '2024-06-12', 7.7, 'He leído muy buenos comentarios sobre este arroz, pero la verdad que tampoco he encontrado mucha diferencia respecto a otros', 23, 'a', 'Mari');
INSERT INTO `COMENTARIOS` (`ID_COMENTARIO`, `FECHA`, `VALORACION`, `COMENTARIO`, `ID_PRODUCTO`, `ESTADO`, `USERNAME`)VALUES (3, '2024-07-20', 6, 'No es la primera vez que compro zanahorias aquí pero esta vez han venido muy mal espero que la próxima vez estén en buena calidad', 16, 'a', 'Noeli');
INSERT INTO `COMENTARIOS` (`ID_COMENTARIO`, `FECHA`, `VALORACION`, `COMENTARIO`, `ID_PRODUCTO`, `ESTADO`, `USERNAME`)VALUES (4, '2024-01-01', 8, 'El embalaje de las mandarinas es muy seguro y práctico.', 1, 'a', 'Geri');
INSERT INTO `COMENTARIOS` (`ID_COMENTARIO`, `FECHA`, `VALORACION`, `COMENTARIO`, `ID_PRODUCTO`, `ESTADO`, `USERNAME`)VALUES (5, '2024-01-02', 10, '¡Los productos orgánicos son mi opción favorita en esta tienda!', 1, 'a', 'Mari');
INSERT INTO `COMENTARIOS` (`ID_COMENTARIO`, `FECHA`, `VALORACION`, `COMENTARIO`, `ID_PRODUCTO`, `ESTADO`, `USERNAME`)VALUES (6, '2024-01-03', 9, 'Manzanas frescas y de calidad, servicio de entrega rápido.', 2, 'a', 'Noeli');
INSERT INTO `COMENTARIOS` (`ID_COMENTARIO`, `FECHA`, `VALORACION`, `COMENTARIO`, `ID_PRODUCTO`, `ESTADO`, `USERNAME`)VALUES (7, '2024-01-04', 10, 'Los precios de las manzanas son competitivos y la calidad es excelente.', 2, 'a', 'Geri');
INSERT INTO `COMENTARIOS` (`ID_COMENTARIO`, `FECHA`, `VALORACION`, `COMENTARIO`, `ID_PRODUCTO`, `ESTADO`, `USERNAME`)VALUES (8, '2024-01-05', 8, 'Muy buenos plátanos.', 3, 'a', 'Mari');
INSERT INTO `COMENTARIOS` (`ID_COMENTARIO`, `FECHA`, `VALORACION`, `COMENTARIO`, `ID_PRODUCTO`, `ESTADO`, `USERNAME`)VALUES (9, '2024-01-06', 10, 'Los mejores plátanos de Canarias', 3, 'a', 'Noeli');
INSERT INTO `COMENTARIOS` (`ID_COMENTARIO`, `FECHA`, `VALORACION`, `COMENTARIO`, `ID_PRODUCTO`, `ESTADO`, `USERNAME`)VALUES (10, '2024-01-07', 9, 'Comprar aquí es garantía de recibir granadas frescas y deliciosas.', 4, 'a', 'Geri');
INSERT INTO `COMENTARIOS` (`ID_COMENTARIO`, `FECHA`, `VALORACION`, `COMENTARIO`, `ID_PRODUCTO`, `ESTADO`, `USERNAME`)VALUES (11, '2024-01-08', 8, 'Nunca he tenido problemas con la calidad de las granadas.', 4, 'a', 'Mari');
INSERT INTO `COMENTARIOS` (`ID_COMENTARIO`, `FECHA`, `VALORACION`, `COMENTARIO`, `ID_PRODUCTO`, `ESTADO`, `USERNAME`)VALUES (12, '2024-01-09', 8, 'Las peras llegan en perfecto estado gracias al embalaje.', 5, 'a', 'Noeli');
INSERT INTO `COMENTARIOS` (`ID_COMENTARIO`, `FECHA`, `VALORACION`, `COMENTARIO`, `ID_PRODUCTO`, `ESTADO`, `USERNAME`)VALUES (13, '2024-01-10', 10, '¡La frescura de las peras es impresionante, 100% recomendado!', 5, 'a', 'Geri');
INSERT INTO `COMENTARIOS` (`ID_COMENTARIO`, `FECHA`, `VALORACION`, `COMENTARIO`, `ID_PRODUCTO`, `ESTADO`, `USERNAME`)VALUES (14, '2024-01-11', 10, '¡Una experiencia de compra de mangos impecable de principio a fin!', 6, 'a', 'Mari');
INSERT INTO `COMENTARIOS` (`ID_COMENTARIO`, `FECHA`, `VALORACION`, `COMENTARIO`, `ID_PRODUCTO`, `ESTADO`, `USERNAME`)VALUES (15, '2024-01-12', 9, 'Los mangos llegan bien protegidos y en perfecto estado.', 6, 'a', 'Noeli');
INSERT INTO `COMENTARIOS` (`ID_COMENTARIO`, `FECHA`, `VALORACION`, `COMENTARIO`, `ID_PRODUCTO`, `ESTADO`, `USERNAME`)VALUES (16, '2024-01-13', 9, 'Los productos ecológicos son una gran opción para cuidar el planeta.', 7, 'a', 'Geri');
INSERT INTO `COMENTARIOS` (`ID_COMENTARIO`, `FECHA`, `VALORACION`, `COMENTARIO`, `ID_PRODUCTO`, `ESTADO`, `USERNAME`)VALUES (17, '2024-01-14', 10, 'La presentación de los melocotones es impecable, ¡un 10!', 7, 'a', 'Mari');
INSERT INTO `COMENTARIOS` (`ID_COMENTARIO`, `FECHA`, `VALORACION`, `COMENTARIO`, `ID_PRODUCTO`, `ESTADO`, `USERNAME`)VALUES (18, '2024-01-15', 10, 'La calidad de las ciruelas supera mis expectativas cada vez.', 8, 'a', 'Noeli');
INSERT INTO `COMENTARIOS` (`ID_COMENTARIO`, `FECHA`, `VALORACION`, `COMENTARIO`, `ID_PRODUCTO`, `ESTADO`, `USERNAME`)VALUES (19, '2024-01-16', 10, 'Me encanta la opción de poder dejar reseñas sobre las mejores ciruelas.', 8, 'a', 'Geri');
INSERT INTO `COMENTARIOS` (`ID_COMENTARIO`, `FECHA`, `VALORACION`, `COMENTARIO`, `ID_PRODUCTO`, `ESTADO`, `USERNAME`)VALUES (20, '2024-01-17', 9, 'Siempre encuentro los ingredientes más frescos para mis recetas.', 9, 'a', 'Mari');
INSERT INTO `COMENTARIOS` (`ID_COMENTARIO`, `FECHA`, `VALORACION`, `COMENTARIO`, `ID_PRODUCTO`, `ESTADO`, `USERNAME`)VALUES (21, '2024-01-18', 8, 'Las uvas llegaron justo a tiempo para mi evento más especial.', 9, 'a', 'Noeli');
INSERT INTO `COMENTARIOS` (`ID_COMENTARIO`, `FECHA`, `VALORACION`, `COMENTARIO`, `ID_PRODUCTO`, `ESTADO`, `USERNAME`)VALUES (22, '2024-01-19', 9, 'La variedad de productos es impresionante, ¡nunca me aburro!', 10, 'a', 'Geri');
INSERT INTO `COMENTARIOS` (`ID_COMENTARIO`, `FECHA`, `VALORACION`, `COMENTARIO`, `ID_PRODUCTO`, `ESTADO`, `USERNAME`)VALUES (23, '2024-01-20', 10, 'La calidad de las acelgas es insuperable, ¡siempre frescas y deliciosas!', 10, 'a', 'Mari');
INSERT INTO `COMENTARIOS` (`ID_COMENTARIO`, `FECHA`, `VALORACION`, `COMENTARIO`, `ID_PRODUCTO`, `ESTADO`, `USERNAME`)VALUES (24, '2024-01-21', 9, 'La entrega es rápida y los apios llegan en perfecto estado.', 11, 'a', 'Noeli');
INSERT INTO `COMENTARIOS` (`ID_COMENTARIO`, `FECHA`, `VALORACION`, `COMENTARIO`, `ID_PRODUCTO`, `ESTADO`, `USERNAME`)VALUES (25, '2024-01-22', 8, 'Los alimentos frescos, como los apios, son esenciales para mi dieta, ¡gracias!', 11, 'a', 'Geri');
INSERT INTO `COMENTARIOS` (`ID_COMENTARIO`, `FECHA`, `VALORACION`, `COMENTARIO`, `ID_PRODUCTO`, `ESTADO`, `USERNAME`)VALUES (26, '2024-01-23', 9, 'La experiencia de compra de productos grandes como las calabazas en esta tienda es sinónimo de comodidad y eficiencia.', 12, 'a', 'Mari');
INSERT INTO `COMENTARIOS` (`ID_COMENTARIO`, `FECHA`, `VALORACION`, `COMENTARIO`, `ID_PRODUCTO`, `ESTADO`, `USERNAME`)VALUES (27, '2024-01-24', 10, 'Cuando abro un paquete de calabazas de esta tienda, sé que me esperan productos de primera.', 12, 'a', 'Noeli');
INSERT INTO `COMENTARIOS` (`ID_COMENTARIO`, `FECHA`, `VALORACION`, `COMENTARIO`, `ID_PRODUCTO`, `ESTADO`, `USERNAME`)VALUES (28, '2024-01-25', 9, 'La calidad de los productos es consistente, ¡siempre compro aquí las patatas!', 13, 'a', 'Geri');
INSERT INTO `COMENTARIOS` (`ID_COMENTARIO`, `FECHA`, `VALORACION`, `COMENTARIO`, `ID_PRODUCTO`, `ESTADO`, `USERNAME`)VALUES (29, '2024-01-26', 9, 'Las patatas llegan bien embaladas y protegidas, ¡excelente servicio!', 13, 'a', 'Mari');
INSERT INTO `COMENTARIOS` (`ID_COMENTARIO`, `FECHA`, `VALORACION`, `COMENTARIO`, `ID_PRODUCTO`, `ESTADO`, `USERNAME`)VALUES (30, '2024-01-27', 10, 'La calidad de los puerros es excepcional, ¡siempre frescos y deliciosos!', 14, 'a', 'Noeli');
INSERT INTO `COMENTARIOS` (`ID_COMENTARIO`, `FECHA`, `VALORACION`, `COMENTARIO`, `ID_PRODUCTO`, `ESTADO`, `USERNAME`)VALUES (31, '2024-01-28', 8, 'La tienda ofrece una amplia variedad de opciones para todos los gustos', 14, 'a', 'Geri');
INSERT INTO `COMENTARIOS` (`ID_COMENTARIO`, `FECHA`, `VALORACION`, `COMENTARIO`, `ID_PRODUCTO`, `ESTADO`, `USERNAME`)VALUES (32, '2024-01-29', 9, 'La variedad de opciones disponibles es impresionante y satisfactoria. ¡Deliciosas cebollas!', 15, 'a', 'Mari');
INSERT INTO `COMENTARIOS` (`ID_COMENTARIO`, `FECHA`, `VALORACION`, `COMENTARIO`, `ID_PRODUCTO`, `ESTADO`, `USERNAME`)VALUES (33, '2024-01-30', 9, 'La tienda se ha convertido en mi destino principal para compras de cebollas.', 15, 'a', 'Noeli');
INSERT INTO `COMENTARIOS` (`ID_COMENTARIO`, `FECHA`, `VALORACION`, `COMENTARIO`, `ID_PRODUCTO`, `ESTADO`, `USERNAME`)VALUES (34, '2024-01-31', 9, 'Las zanahorias llegan en el tiempo estimado, ¡muy eficientes!', 16, 'a', 'Geri');
INSERT INTO `COMENTARIOS` (`ID_COMENTARIO`, `FECHA`, `VALORACION`, `COMENTARIO`, `ID_PRODUCTO`, `ESTADO`, `USERNAME`)VALUES (35, '2024-02-01', 8, 'Los precios son justos para la calidad de las zanahorias.', 16, 'a', 'Mari');
INSERT INTO `COMENTARIOS` (`ID_COMENTARIO`, `FECHA`, `VALORACION`, `COMENTARIO`, `ID_PRODUCTO`, `ESTADO`, `USERNAME`)VALUES (36, '2024-02-02', 10, 'Los tomates de esta tienda son la definición de calidad premium.', 17, 'a', 'Noeli');
INSERT INTO `COMENTARIOS` (`ID_COMENTARIO`, `FECHA`, `VALORACION`, `COMENTARIO`, `ID_PRODUCTO`, `ESTADO`, `USERNAME`)VALUES (37, '2024-02-03', 10, 'La facilidad de encontrar productos de calidad me mantiene fiel a esta tienda.', 17, 'a', 'Geri');
INSERT INTO `COMENTARIOS` (`ID_COMENTARIO`, `FECHA`, `VALORACION`, `COMENTARIO`, `ID_PRODUCTO`, `ESTADO`, `USERNAME`)VALUES (38, '2024-02-04', 9, 'La entrega puntual me permite planificar mis comidas con anticipación. Coliflores Peco siempre en mi mesa.', 18, 'a', 'Mari');
INSERT INTO `COMENTARIOS` (`ID_COMENTARIO`, `FECHA`, `VALORACION`, `COMENTARIO`, `ID_PRODUCTO`, `ESTADO`, `USERNAME`)VALUES (39, '2024-02-05', 9, 'Las coliflores llegan en perfecto estado, ¡listos para disfrutar!', 18, 'a', 'Noeli');
INSERT INTO `COMENTARIOS` (`ID_COMENTARIO`, `FECHA`, `VALORACION`, `COMENTARIO`, `ID_PRODUCTO`, `ESTADO`, `USERNAME`)VALUES (40, '2024-02-06', 9, 'Las frutas y verduras son siempre frescas y sabrosas. Nunca he probado mejores calabacines', 19, 'a', 'Geri');
INSERT INTO `COMENTARIOS` (`ID_COMENTARIO`, `FECHA`, `VALORACION`, `COMENTARIO`, `ID_PRODUCTO`, `ESTADO`, `USERNAME`)VALUES (41, '2024-02-07', 9, 'Los productos de temporada como los calabacines siempre están frescos y deliciosos.', 19, 'a', 'Mari');
INSERT INTO `COMENTARIOS` (`ID_COMENTARIO`, `FECHA`, `VALORACION`, `COMENTARIO`, `ID_PRODUCTO`, `ESTADO`, `USERNAME`)VALUES (42, '2024-02-08', 10, 'Cada compra es una experiencia gastronómica única y satisfactoria. Ni en la huerta de mi vecina hay berenjenas tan ricas.', 20, 'a', 'Noeli');
INSERT INTO `COMENTARIOS` (`ID_COMENTARIO`, `FECHA`, `VALORACION`, `COMENTARIO`, `ID_PRODUCTO`, `ESTADO`, `USERNAME`)VALUES (43, '2024-02-09', 8, 'Las berenjenas siempre superan mis expectativas en calidad y frescura.', 20, 'a', 'Geri');
INSERT INTO `COMENTARIOS` (`ID_COMENTARIO`, `FECHA`, `VALORACION`, `COMENTARIO`, `ID_PRODUCTO`, `ESTADO`, `USERNAME`)VALUES (44, '2024-02-10', 9, 'Los quesos padanos son imprescindibles en mi cocina.', 21, 'a', 'Mari');
INSERT INTO `COMENTARIOS` (`ID_COMENTARIO`, `FECHA`, `VALORACION`, `COMENTARIO`, `ID_PRODUCTO`, `ESTADO`, `USERNAME`)VALUES (45, '2024-02-11', 10, 'La pasión por la excelencia culinaria se transmite a través de cada producto.', 21, 'a', 'Noeli');
INSERT INTO `COMENTARIOS` (`ID_COMENTARIO`, `FECHA`, `VALORACION`, `COMENTARIO`, `ID_PRODUCTO`, `ESTADO`, `USERNAME`)VALUES (46, '2024-02-12', 10, 'La calidad es evidente en toda la gama de productos. La mejor leche es la asturiana', 22, 'a', 'Geri');
INSERT INTO `COMENTARIOS` (`ID_COMENTARIO`, `FECHA`, `VALORACION`, `COMENTARIO`, `ID_PRODUCTO`, `ESTADO`, `USERNAME`)VALUES (47, '2024-02-13', 9, 'Los estándares de calidad de esta tienda son simplemente impecables.', 22, 'a', 'Mari');
INSERT INTO `COMENTARIOS` (`ID_COMENTARIO`, `FECHA`, `VALORACION`, `COMENTARIO`, `ID_PRODUCTO`, `ESTADO`, `USERNAME`)VALUES (48, '2024-02-14', 10, 'La diversidad de productos hace que cada compra sea emocionante. ¡Ni los arroces del delta!', 23, 'a', 'Noeli');
INSERT INTO `COMENTARIOS` (`ID_COMENTARIO`, `FECHA`, `VALORACION`, `COMENTARIO`, `ID_PRODUCTO`, `ESTADO`, `USERNAME`)VALUES (49, '2024-02-15', 9, 'La atención a los detalles demuestra un compromiso genuino con la calidad.', 23, 'a', 'Geri');
INSERT INTO `COMENTARIOS` (`ID_COMENTARIO`, `FECHA`, `VALORACION`, `COMENTARIO`, `ID_PRODUCTO`, `ESTADO`, `USERNAME`)VALUES (50, '2024-02-16', 9, 'La relación calidad-precio de los jamones es inigualable en el mercado.', 24, 'a', 'Mari');
INSERT INTO `COMENTARIOS` (`ID_COMENTARIO`, `FECHA`, `VALORACION`, `COMENTARIO`, `ID_PRODUCTO`, `ESTADO`, `USERNAME`)VALUES (51, '2024-02-17', 9, 'La excelencia en el servicio al cliente eleva aún más el valor de estos jamones.', 24, 'a', 'Noeli');
INSERT INTO `COMENTARIOS` (`ID_COMENTARIO`, `FECHA`, `VALORACION`, `COMENTARIO`, `ID_PRODUCTO`, `ESTADO`, `USERNAME`)VALUES (52, '2024-02-18', 8, 'Esta tienda es mi secreto hacer sandwiches de alta calidad', 25, 'a', 'Geri');
INSERT INTO `COMENTARIOS` (`ID_COMENTARIO`, `FECHA`, `VALORACION`, `COMENTARIO`, `ID_PRODUCTO`, `ESTADO`, `USERNAME`)VALUES (53, '2024-02-19', 9, 'Cada pedido de jamón bajo en grasas es un paso más hacia una vida más saludable.', 25, 'a', 'Mari');
INSERT INTO `COMENTARIOS` (`ID_COMENTARIO`, `FECHA`, `VALORACION`, `COMENTARIO`, `ID_PRODUCTO`, `ESTADO`, `USERNAME`)VALUES (54, '2024-02-20', 9, 'Las pastas de esta tienda son el alma de mis platos italianos favoritos.', 26, 'a', 'Noeli');
INSERT INTO `COMENTARIOS` (`ID_COMENTARIO`, `FECHA`, `VALORACION`, `COMENTARIO`, `ID_PRODUCTO`, `ESTADO`, `USERNAME`)VALUES (55, '2024-02-21', 10, 'Cada producto italiano de Peco es un tesoro culinario esperando ser descubierto.', 26, 'a', 'Geri');
INSERT INTO `COMENTARIOS` (`ID_COMENTARIO`, `FECHA`, `VALORACION`, `COMENTARIO`, `ID_PRODUCTO`, `ESTADO`, `USERNAME`)VALUES (56, '2024-02-22', 8, 'La amplia selección de productos permite satisfacer los gustos más exigentes. ¡Acompaño todo con miel!', 27, 'a', 'Mari');
INSERT INTO `COMENTARIOS` (`ID_COMENTARIO`, `FECHA`, `VALORACION`, `COMENTARIO`, `ID_PRODUCTO`, `ESTADO`, `USERNAME`)VALUES (57, '2024-02-23', 9, 'La confiabilidad y consistencia en la calidad de las mieles son incomparables.', 27, 'a', 'Noeli');
INSERT INTO `COMENTARIOS` (`ID_COMENTARIO`, `FECHA`, `VALORACION`, `COMENTARIO`, `ID_PRODUCTO`, `ESTADO`, `USERNAME`)VALUES (58, '2024-02-24', 9, 'La calidad de las nueces nunca deja de sorprenderme gratamente.', 28, 'a', 'Geri');
INSERT INTO `COMENTARIOS` (`ID_COMENTARIO`, `FECHA`, `VALORACION`, `COMENTARIO`, `ID_PRODUCTO`, `ESTADO`, `USERNAME`)VALUES (59, '2024-02-25', 10, 'Esta tienda es el paraíso para los amantes de las nueces.', 28, 'a', 'Mari');
INSERT INTO `COMENTARIOS` (`ID_COMENTARIO`, `FECHA`, `VALORACION`, `COMENTARIO`, `ID_PRODUCTO`, `ESTADO`, `USERNAME`)VALUES (60, '2024-02-26', 10, 'Los frutos secos son de la más alta calidad, ¡ideales como snack!', 29, 'a', 'Noeli');
INSERT INTO `COMENTARIOS` (`ID_COMENTARIO`, `FECHA`, `VALORACION`, `COMENTARIO`, `ID_PRODUCTO`, `ESTADO`, `USERNAME`)VALUES (61, '2024-02-27', 9, 'La comodidad de acceder a las mejores almendras desde casa es invaluable.', 29, 'a', 'Geri');
INSERT INTO `COMENTARIOS` (`ID_COMENTARIO`, `FECHA`, `VALORACION`, `COMENTARIO`, `ID_PRODUCTO`, `ESTADO`, `USERNAME`)VALUES (62, '2024-02-28', 9, 'Los mejores cacahuetes para acompañar mientras veo a la selección.', 30, 'a', 'Mari');
INSERT INTO `COMENTARIOS` (`ID_COMENTARIO`, `FECHA`, `VALORACION`, `COMENTARIO`, `ID_PRODUCTO`, `ESTADO`, `USERNAME`)VALUES (63, '2024-02-29', 9, 'La calidad superior de los cacahuetes eleva el estándar de mi despensa.', 30, 'a', 'Noeli');



CREATE TABLE CUENTA_USUARIO
(ID_CUENTA INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
NOMBRE VARCHAR(100),
APELLIDO VARCHAR(100),
NUMERO_TARGETA VARCHAR(100),
CADUCIDAD DATE,
CVC VARCHAR(100),
SALDO DOUBLE(9,2),
ESTADO VARCHAR(50), -- CAMPO QUE UTILIZAREMOS PARA OCULTAR O MOSTRAR EL OBJETO A = ACTIVADO, D = DESACTIVADO
USERNAME VARCHAR(50),
FOREIGN KEY (USERNAME) REFERENCES USUARIOS(USERNAME)
);

INSERT INTO `CUENTA_USUARIO`(`ID_CUENTA`, `NOMBRE`, `APELLIDO`, `NUMERO_TARGETA`, `CADUCIDAD`, `CVC`, `SALDO`, `ESTADO`, `USERNAME`) VALUES (1, 'Gerard', 'Perujo', '5812-6985-1475-3325', '2027-06-11', '254', 2000, 'a', 'Geri');
INSERT INTO `CUENTA_USUARIO`(`ID_CUENTA`, `NOMBRE`, `APELLIDO`, `NUMERO_TARGETA`, `CADUCIDAD`, `CVC`, `SALDO`, `ESTADO`, `USERNAME`) VALUES (2, 'Maria', 'Isabel', '0325-5598-4415-7852', '2025-03-10', '564', 3000, 'a', 'Mari');
INSERT INTO `CUENTA_USUARIO`(`ID_CUENTA`, `NOMBRE`, `APELLIDO`, `NUMERO_TARGETA`, `CADUCIDAD`, `CVC`, `SALDO`, `ESTADO`, `USERNAME`) VALUES (3, 'Noelia', 'Villahermosa', '9852-5147-9856-3625', '2028-11-25', '145', 4000, 'a', 'Noeli');

CREATE TABLE DIRECCION_USUARIO
(ID_DIRECCION INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
CALLE VARCHAR(100),
NUMERO VARCHAR(50),
PISO VARCHAR(50),
PUERTA VARCHAR(50),
POBLACION VARCHAR(100),
PROVINCIA VARCHAR(100),
PAIS VARCHAR(100),
VIVIENDA VARCHAR(20), -- PARA FILTRAR "CASA", "PISO"
ESTADO VARCHAR(50), -- CAMPO QUE UTILIZAREMOS PARA OCULTAR O MOSTRAR EL OBJETO A = ACTIVADO, D = DESACTIVADO
USERNAME VARCHAR(50),
FOREIGN KEY (USERNAME) REFERENCES USUARIOS(USERNAME)
);

INSERT INTO `DIRECCION_USUARIO` (`ID_DIRECCION`, `CALLE`, `NUMERO`, `PISO`, `PUERTA`, `POBLACION`, `PROVINCIA`, `PAIS`, `VIVIENDA`, `ESTADO`, `USERNAME`) VALUES(1, 'Calle Bell-Lloch', '1', 'bajo', '2', 'Puigcerdá', 'Gerona', 'España', 'piso', 'a', 'Geri');
INSERT INTO `DIRECCION_USUARIO` (`ID_DIRECCION`, `CALLE`, `NUMERO`, `PISO`, `PUERTA`, `POBLACION`, `PROVINCIA`, `PAIS`, `VIVIENDA`, `ESTADO`, `USERNAME`) VALUES(2,  'Avenida España', '200', '4','6', 'Madrid', 'Madrid', 'España', 'piso', 'a', 'Mari');
INSERT INTO `DIRECCION_USUARIO` (`ID_DIRECCION`, `CALLE`, `NUMERO`, `PISO`, `PUERTA`, `POBLACION`, `PROVINCIA`, `PAIS`, `VIVIENDA`, `ESTADO`, `USERNAME`) VALUES(3,  'Calle Príncipe Felipe', 30, null , null , 'Ciudad Real', 'Ciudad Real', 'España', 'casa', 'a', 'Noeli');
INSERT INTO `DIRECCION_USUARIO` (`ID_DIRECCION`, `CALLE`, `NUMERO`, `PISO`, `PUERTA`, `POBLACION`, `PROVINCIA`, `PAIS`, `VIVIENDA`, `ESTADO`, `USERNAME`) VALUES(4, 'Calle Gonzalo', '120', 'bajo', '2', 'Barcelona', 'Barcelona', 'España', 'piso', 'a', 'Geri');
INSERT INTO `DIRECCION_USUARIO` (`ID_DIRECCION`, `CALLE`, `NUMERO`, `PISO`, `PUERTA`, `POBLACION`, `PROVINCIA`, `PAIS`, `VIVIENDA`, `ESTADO`, `USERNAME`) VALUES(5, 'Avenida Pirineos','2', null, null, 'Puigcerdá', 'Gerona', 'España', 'casa', 'a', 'Geri');
INSERT INTO `DIRECCION_USUARIO` (`ID_DIRECCION`, `CALLE`, `NUMERO`, `PISO`, `PUERTA`, `POBLACION`, `PROVINCIA`, `PAIS`, `VIVIENDA`, `ESTADO`, `USERNAME`) VALUES(6, 'Felipe VII', '4', 'bajo', '2', 'Gerona', 'Gerona', 'España', 'piso', 'a', 'Geri');
INSERT INTO `DIRECCION_USUARIO` (`ID_DIRECCION`, `CALLE`, `NUMERO`, `PISO`, `PUERTA`, `POBLACION`, `PROVINCIA`, `PAIS`, `VIVIENDA`, `ESTADO`, `USERNAME`) VALUES(7, 'Calle Bell-Lloch', '1', null, null, 'Puigcerdá', 'Gerona', 'España', 'casa', 'a', 'Geri');
INSERT INTO `DIRECCION_USUARIO` (`ID_DIRECCION`, `CALLE`, `NUMERO`, `PISO`, `PUERTA`, `POBLACION`, `PROVINCIA`, `PAIS`, `VIVIENDA`, `ESTADO`, `USERNAME`) VALUES(8, 'Calle Bell-Lloch', '1', 'bajo', '2', 'Puigcerdá', 'Gerona', 'España', 'piso', 'a', 'Geri');