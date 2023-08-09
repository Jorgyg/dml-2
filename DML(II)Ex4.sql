USE actividades;

-4.1
SELECT nombre FROM peliculas;

-4.2
SELECT calificaciONedad FROM peliculas
GROUP BY calificaciONedad;

-4.3
SELECT * FROM peliculas
WHERE calificaciONedad IS NULL;

-4.4
SELECT * FROM salas
WHERE pelicula IS NULL;

-4.5
SELECT * FROM salas
LEFT JOIN peliculas
ON salas.pelicula=peliculas.codigo
WHERE pelicula IS NOT NULL;

-4.6
SELECT * FROM peliculas 
LEFT JOIN salas
ON salas.pelicula=peliculas.codigo
WHERE pelicula IS NOT NULL;

-4.7
SELECT nombre FROM peliculas 
WHERE codigo NOT IN
(SELECT pelicula FROM salas WHERE pelicula IS NOT NULL);

-4.8
INSERT INTO peliculas (codigo,nombre,calificaciONedad) VALUES 
(10, 'Un', 'Dos', 'Tres', 7);

-4.9
UPDATE peliculas SET calificaciONedad=13 WHERE calificaciONedad IS NULL AND codigo>0 ;

-4.10
DELETE FROM salas 
WHERE pelicula IN 
(SELECT codigo FROM peliculas WHERE calificaciONedad='PG');