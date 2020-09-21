CREATE DATABASE peliculas;
\c peliculas
CREATE TABLE peliculas(
    id SERIAL,
    Pelicula VARCHAR(100),
    Año_estreno INT,
    Director VARCHAR(100),
    PRIMARY KEY(id)
);
CREATE TABLE reparto(
    id SERIAL,
    Reparto VARCHAR(50),
    FOREIGN KEY (id) REFERENCES peliculas(id)
);
\copy peliculas FROM '/home/co/Escritorio/DESAFIO LATAM/Introduccion_Base_de_datos/DESAFIO2/Apoyo Desafío 2 -  Top 100/peliculas.csv' csv header;
\copy reparto FROM '/home/co/Escritorio/DESAFIO LATAM/Introduccion_Base_de_datos/DESAFIO2/Apoyo Desafío 2 -  Top 100/reparto.csv' csv;
SELECT * FROM peliculas WHERE id=2;
SELECT * FROM reparto WHERE id=2;
-- SELECT id, reparto FROM reparto WHERE reparto='Harrison Ford';
SELECT y.pelicula
FROM(
    SELECT id, reparto FROM reparto WHERE reparto='Harrison Ford') AS x
    INNER JOIN peliculas AS y ON x.id=y.id;

SELECT director, COUNT(*) FROM peliculas GROUP BY director ORDER BY COUNT(*) DESC LIMIT 10;
SELECT COUNT(distinct reparto) FROM reparto;
SELECT pelicula FROM peliculas WHERE año_estreno >= 1990 AND año_estreno <= 1999 ORDER BY pelicula ASC;
SELECT reparto FROM reparto LEFT JOIN peliculas ON reparto.id=peliculas.id WHERE peliculas.año_estreno=2001;
SELECT reparto FROM reparto LEFT JOIN peliculas ON reparto.id=peliculas.id WHERE peliculas.año_estreno=2008;