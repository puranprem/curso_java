-- iniciar xammp , luego my sql
mysql -u root -p

--para crear una base de datos.;
CREATE DATABASE root

-- para poder usar una base de datos especifica en la consola
USE

-- muestra las bases de datos disponibles en el equipo
SHOW DATABASES;

-- borra un base de datos Warning!!!
DROP DATABASE nombrebasedatos_a_eliminar

--creación de tablas
CREATE TABLE nombre_tabla();
--Ej:
    CREATE TABLE personas(
        id INT,
        nombre VARCHAR(255),
        apellido VARCHAR(255)
    );


-- cuantatas tablas tenemos en nuestra bd
SHOWTABLES;

-- borrar una tabla dela bd
DROP TABLE nombre_de_la_tabla;

--insertar registros
INSERT INTO nombre_tabla (columna1, columna2, columna3..) VALUES (1,"Alexis","quezada");

--consulta de registros // * Significa "todos"
SELECT * FROM nombre_tabla;
SELECT id,nombre FROM nombre_de_la_tabla;

--para conocer la estructura de una tabla. Columna y filas.
DESCRIBE nombre_de_la_tabla;


--Filtrar dentro de los registros dandole una condición.
SELECT * FROM persona 
WHERE id=2
;

SELECT * FROM nombre_de_la_tabla
WHERE nombre LIKE "%le%"
;