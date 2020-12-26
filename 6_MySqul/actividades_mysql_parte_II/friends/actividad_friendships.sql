-- Crea una base de datos llamada "amigos" y luego importe friends.sql. 
-- Esto creará dos nuevas tablas: usuarios y amistades.
-- Usando el siguiente ERD como referencia, escribe una consulta SQL que devuelva una lista de 
-- usuarios junto con los nombres de sus amigos.


SELECT users.first_name, users.last_name, user2.first_name AS friends_first_name, user2.last_name AS friends_last_name
FROM users
LEFT JOIN friendships ON users.id = friendships.user_id -- usuarios
LEFT JOIN users as user2 ON friendships.friend_id = user2.id -- los mejores amigos de los usuarios



-- Ejercicio Adicional

--  También escriba las consultas SQL necesarias para realizar las siguientes tareas:



-- 1 Devuelva a todos los usuarios que son amigos de Kermit, asegúrese de que sus nombres
-- se muestren en los resultados.


-- 2 Devuelve el recuento de todas las amistades.
select users.first_name,count(friendships.friend_id)
from users 
join friendships  on users.id=friendships.user_id
group by users.id
-- 3 Descubre quién tiene más amigos y devuelve el recuento de sus amigos.

-- 4 Crea un nuevo usuario y hazlos amigos de Eli Byers, Kermit The Frog y Marky Mark.
select* from users;
insert into users ( id, first_name, last_name) -- insertando nuevo usuario
value(10,'Juanito','Alcachofa'); 

insert into friendships(user_id, friend_id) -- agragando amigos a Eli
value(10,4); 
insert into friendships(user_id, friend_id) -- agragando amigos a Eli
value(10,2); 
insert into friendships(user_id, friend_id) -- agragando amigos a Eli
value(10,5); 
-- 5 Devuelve a los amigos de Eli en orden alfabético.
-- 6 Eliminar a Marky Mark de los amigos de Eli.
-- 7 Devuelve todas las amistades, mostrando solo el nombre y apellido de ambos amigos