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
select region, count(id) as paises from countries
group by region
order by paises desc