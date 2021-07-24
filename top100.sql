-- 1. Crear base de datos 'peliculas'
CREATE DATABASE peliculas;

-- Entrar a la base de datos
\c peliculas;

--2. Cargar ambos archivos a su tabla correspondiente.
-- Crear tablas llamada peliculas y reparto
CREATE TABLE peliculas(
    id_movie INT,
    movie VARCHAR(250),
    release_date VARCHAR(4),
    director VARCHAR(100),
    PRIMARY KEY(id_movie)
);

CREATE TABLE reparto(
    id INT,
    starring VARCHAR(100),
    FOREIGN KEY (id) REFERENCES peliculas(id_movie)
);

-- Importar datos de peliculas.csv
\copy peliculas FROM '/home/valentina/Documentos/3. Base de datos postgreSQL/Bases de datos relacionales/desafio_top100/peliculas.csv' csv header;

-- Importar datos de reparto.csv
\copy reparto FROM '/home/valentina/Documentos/3. Base de datos postgreSQL/Bases de datos relacionales/desafio_top100/reparto.csv' csv header;

--3. Obtener el ID de la película “Titanic”.
SELECT id_movie FROM peliculas WHERE movie='Titanic';

--4. Listar a todos los actores que aparecen en la película "Titanic".
SELECT peliculas.movie, reparto.starring
FROM peliculas
INNER JOIN reparto ON peliculas.id_movie=reparto.id
WHERE movie='Titanic';

--5. Consultar en cuántas películas del top 100 participa Harrison Ford
SELECT COUNT (*)
FROM peliculas
INNER JOIN reparto ON peliculas.id_movie=reparto.id
WHERE starring='Harrison Ford';

--6. Indicar las películas estrenadas entre los años 1990 y 1999 ordenadas por título de manera ascendente.
SELECT * FROM peliculas WHERE release_date BETWEEN '1990' AND '1999' ORDER BY release_date ASC;

--7. Hacer una consulta SQL que muestre los títulos con su longitud, la longitud debe ser nombrado para la consulta como “longitud_titulo”.
SELECT movie, LENGTH(movie) AS longitud_titulo FROM Peliculas;

--8. Consultar cual es la longitud más grande entre todos los títulos de las películas.
SELECT MAX(LENGTH(movie)) AS longitud_titulo FROM Peliculas;

--FIN DESAFIO--
