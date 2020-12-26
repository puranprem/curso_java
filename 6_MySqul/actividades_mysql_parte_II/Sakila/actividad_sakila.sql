-- SAKILA--

--1. ¿Qué consulta ejecutarías para obtener todos los clientes dentro de city_id = 312?
-- Su consulta debe devolver el nombre, apellido, correo electrónico y dirección del cliente.
select  customer.first_name, customer.last_name, customer.email, address.address, address.district
from customer
join address
on customer_id = address.city_id
where address.city_id= 312

-- 2. ¿Qué consulta harías para obtener todas las películas de comedia? 
-- Su consulta debe devolver el título de la película, la descripción, el año de estreno, 
-- la calificación, las características especiales y el género (categoría).

SELECT film.title, film.description, film.release_year, film.rating, film.special_features, category.name
FROM film
INNER JOIN film_category ON  film.film_id = film_category.film_id
INNER JOIN category ON film_category.category_id = category.category_id
WHERE category.name = 'drama';



-- 3. ¿Qué consulta harías para obtener todas las películas unidas por actor_id = 5? 
-- Su consulta debe devolver la identificación del actor, el nombre del actor, 
-- el título de la película, la descripción y el año de lanzamiento.

SELECT actor.actor_id, actor.first_name, film.title, film.description, film.release_year
FROM actor
INNER JOIN film_actor ON actor.actor_id = film_actor.actor_id
INNER JOIN film ON film_actor.film_id = film.film_id
WHERE actor.actor_id = 5;


-- 4. ¿Qué consulta ejecutaría para obtener todos los clientes en store_id = 1 y 
-- dentro de estas ciudades (1, 42, 312 y 459)? Su consulta debe devolver el nombre, 
-- apellido, correo electrónico y dirección del cliente.

SELECT customer.first_name, customer.last_name, customer.email, address.address 
FROM customer
INNER JOIN address ON address.address_id = customer.address_id
INNER JOIN city ON city.city_id = address.city_id
WHERE city.city_id IN (1, 42, 312, 459) AND customer.store_id = 1;



-- 5. ¿Qué consulta realizarías para obtener todas las películas con una "calificación = G" y 
--"característica especial = detrás de escena", unidas por actor_id = 15? Su consulta debe devolver 
--el título de la película, la descripción, el año de lanzamiento, la calificación y la función especial.
-- Sugerencia: puede usar la función LIKE para obtener la parte 'detrás de escena'.

select film.title, film.description,film.release_year, film.special_features,film.rating
from film
inner JOIN film_actor on film_actor.film_id = film.film_id
where film.special_features like '%Behind the scenes%' and film.rating ='G' and film_actor.actor_id = 15

-- 6. 
select film.title, film.film_id, actor.actor_id, actor.first_name
from film
inner join film_actor on film.film_id = film_actor.film_id
inner join  actor on actor.actor_id  = film_actor.actor_id
where film.film_id = 369

--7. ¿Qué consulta harías para obtener todas las películas dramáticas con una tarifa de alquiler de 2.99? 
--Su consulta debe devolver el título de la película, la descripción, el año de estreno, la calificación, 
--las características especiales y el género (categoría).

SELECT film.title, film.description, film.special_features, film.rating, film.release_year, category.name
from film
inner join film_category on film.film_id = film_category.film_id
inner join category on film_category.category_id = category.category_id
where category.name= 'Drama' and film.rental_rate = 2.99

-- 8. ¿Qué consulta harías para obtener todas las películas de acción a las que se une SANDRA KILMER? 
-- Su consulta debe devolver el título de la película, la descripción, el año de estreno, la calificación, 
-- las características especiales, el género (categoría) y el nombre y apellido del actor.


--lo primero es buscar como se llama el lenguaje 
SELECT * FROM  `languages`
WHERE `language` like 'Sl%' order by `language` asc;

--cuando ya sabemos que es "Slovene" ya es posible hacer la selección.

SELECT * FROM `languages` WHERE `language` = 'Slovene' order by `language` asc

--une las tablas lenguaje com la tabla counties a través de su PK y FK.

SELECT * FROM `languages` JOIN countries ON countries.id = `languages`.`country_id` WHERE `language` = 'Slovene' ORDER BY `language` asc

-- finalmente:.....chrarannnnn
SELECT `countries`.`name`,`languages`.`language`,`languages`.`percentage`
FROM `languages` JOIN `countries` ON countries.id = `languages`.`country_id`
WHERE `language` = 'Slovene' 
ORDER BY `language` asc

-- 2. ¿Qué consulta ejecutarías para mostrar el número total de ciudades para cada país? Su consulta debe devolver el nombre del país y el número total de ciudades. Tu consulta debe organizar el resultado por el número de ciudades en orden descendente. (3)

SELECT  `countries`.`name`,COUNT(`cities`.`country_id`) AS total_ciudades
FROM `cities` 
JOIN `countries`
ON `cities`.`country_id` = `countries`.`id`
GROUP BY `cities`.`country_id`
ORDER by total_ciudades DESC;

----ahora con los alias CI para cities y CO para countries
SELECT  co.`name` AS Pais,COUNT(ci.`country_id`) AS total_ciudades
FROM `cities` ci
JOIN `countries` co
ON ci.`country_id` = co.`id`
GROUP BY ci.`country_id`
ORDER by total_ciudades DESC

--3. ¿Qué consulta harías para obtener todas las ciudades de México con una población de más de 500,000?
-- Tu consulta debe organizar el res>ultado por población en orden descendente. (1)

SELECT name as Pais, population as Poblacion
from countries 
where population<500000
order by poblacion desc;

--4. ¿Qué consulta ejecutarías para obtener todos los idiomas en cada país 
--con un porcentaje superior al 89%? Tu consulta debe organizar el resultado
--por porcentaje en orden descendente. (1)
SELECT countries.name as Pais, languages.language as Idioma, languages.percentage as Porcentaje
FROM countries JOIN languages ON  countries.id=languages.country_id
WHERE percentage >89 
ORDER BY percentage DESC;
 
 --5. ¿Qué consulta haría para obtener todos los países con un área
 -- de superficie inferior a 501 y una población superior a 100,000? (2)
 
--REVISAR POR QUE DA ERROR
SELECT countries.name, countries.surface_area,cities.population
FROM countries JOIN  cities  
on countries.id = cities.country_id
WHERE countries.surface_area <501 and cities.population>100.000

--6. ¿Qué consulta harías para obtener países con solo Monarquía Constitucional con un
-- capital superior a 200 y una esperanza de vida superior a 75 años? (1)
SELECT countries.name, countries.surface_area,cities.population
FROM countries JOIN  cities  
on countries.id = cities.country_id
WHERE countries.surface_area <501 and cities.population>100.000

--7. ¿Qué consulta harías para obtener todas las ciudades de Argentina dentro del distrito de Buenos Aires 
--y tener una población superior a 500,000? La consulta debe devolver el nombre del país, 
--el nombre de la ciudad, el distrito y la población. (2)
SELECT countries.name as Pais, cities.name as Ciudad,cities.district as Distrito,cities.population as Poblacion
FROM countries JOIN  cities  
on countries.id = cities.country_id
WHERE cities.district = "Buenos Aires"
and cities.population > 500000

--8. ¿Qué consulta harías para resumir el número de países en cada región? La consulta debe mostrar el nombre de la región 
--y el número de países. Además, la consulta debe organizar el resultado por el número de países en orden descendente. (2)
SELECT film.title, film.description, film.special_features, film.rating, film.release_year, category.name
, actor.first_name, actor.last_name
from film
inner join film_category on film.film_id = film_category.film_id
inner join category on film_category.category_id = category.category_id
inner join film_actor on film.film_id = film_actor.film_id
inner join actor on actor.actor_id  = film_actor.actor_id
where category.name ='Action'and actor.first_name='Sandra'and actor.last_name ='Kilmer'


-- where city.city_id in (1,42,312,459) and customer.store_id=1;
