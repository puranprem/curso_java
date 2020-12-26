LAS QUERIS ANTERIORES YA LAS REALICÉ PERO NO DEJÉ REGISTRO.
DECLARO BAJO JURAMENTO QUE LAS HICE ;)
SAT NAM

SELECT IN SELECT

2.- SELECT NAME
FROM world
WHERE continent='Europe' and 
                gdp/population >(
Select  gdp/population
from world
where name='United Kingdom'
)
3.-
SELECT name, continent FROM world
WHERE continent IN
  (SELECT continent 
     FROM world WHERE name='Australia'
                   OR name='Argentina')
order by name asc

4.-
Select name,population
from world
where population < (select population from world where name ='Poland')
and population >(select population from world where name ='Canada')
5.-
select name ,concat (round(population*100/(SELECT population 
                                                            from world 
                                                            where name ='Germany')),'%')
from world
where continent='Europe'

6.-
select name 
from world
where gdp>  (SELECT  max(gdp)
              FROM world
              where continent='Europe')