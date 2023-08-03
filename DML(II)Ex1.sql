CREATE DATABASE  IF NOT EXISTS `actividades`;
USE `actividades`;

-- Ex 1:
-- 1.1
SELECT nombre
FROM articulos;

-- 1.2
SELECT nombre, precio
FROM articulos;

-- 1.3
SELECT *
FROM articulos
WHERE precio <= 200;

-- 1.4
SELECT *
FROM articulos
WHERE precio BETWEEN 60 AND 120;

-- 1.5
SELECT nombre, precio*166.386
FROM articulos;

-- 1.6
SELECT AVG(precio)
FROM articulos;

-- 1.7
SELECT precio
FROM articulos
WHERE fabricante = 2;

-- 1.8
SELECT COUNT(precio)
FROM articulos
WHERE precio >= 180;

-- 1.9
SELECT nombre, precio
FROM articulos
WHERE precio >= 180
ORDER BY precio DESC, nombre ASC;


-- 1.10
SELECT *
FROM articulos 
INNER JOIN fabricantes ON fabricantes.CODIGO = articulos.FABRICANTE;

-- 1.11
SELECT a.nombre, a.precio, f.codigo AS `Nombre fabricante`
FROM articulos a
INNER JOIN fabricantes f ON f.CODIGO = a.FABRICANTE;

-- 1.12
SELECT f.CODIGO, AVG(a.PRECIO)
FROM articulos a
INNER JOIN fabricantes f ON f.CODIGO = a.FABRICANTE
GROUP BY f.CODIGO;

-- 1.13
SELECT f.NOMBRE, AVG(a.PRECIO)
FROM articulos a
INNER JOIN fabricantes f ON f.CODIGO = a.FABRICANTE
GROUP BY f.NOMBRE;

-- 1.14
SELECT f.NOMBRE
FROM articulos a
INNER JOIN fabricantes f ON f.CODIGO = a.FABRICANTE
GROUP BY f.NOMBRE
HAVING AVG(a.PRECIO) >= 150;

-- 1.15
SELECT NOMBRE AS Producto, PRECIO AS Precio
FROM articulos
WHERE PRECIO = (
    SELECT MIN(PRECIO) 
    FROM articulos
);

-- 1.16
SELECT f.NOMBRE AS Fabricante, a.NOMBRE, a.PRECIO
FROM articulos a
INNER JOIN fabricantes f ON f.CODIGO = a.FABRICANTE
WHERE (a.FABRICANTE, a.PRECIO) IN (
    SELECT FABRICANTE, MAX(PRECIO) AS PrecioMaximo
    FROM articulos
    GROUP BY FABRICANTE
);

-- 1.17
INSERT INTO articulos (NOMBRE, PRECIO, FABRICANTE) VALUES ('Altavoces', 70, 2);

-- 1.18
UPDATE articulos SET NOMBRE = 'Impresora láser' WHERE CODIGO = 8;

-- 1.19
UPDATE articulos SET PRECIO = PRECIO * 0.9;

-- 1.20
SET SQL_SAFE_UPDATES = 0;
UPDATE articulos SET precio = precio - 10 WHERE precio >= 120;
SET SQL_SAFE_UPDATES = 1;

