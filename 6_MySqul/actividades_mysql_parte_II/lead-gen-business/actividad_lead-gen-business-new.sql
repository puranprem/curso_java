-- 1. ¿Qué consulta ejecutaría para obtener los ingresos totales para marzo de 2012?

select MONTHNAME(charged_datetime),sum(amount) total
from billing
where charged_datetime between  '2012/03/01' and '2012/03/31'

--2. ¿Qué consulta ejecutaría para obtener los ingresos totale
-- recaudados del cliente con una identificación de 2?
select sum(amount)
from billing
where client_id=2

-- 3. ¿Qué consulta ejecutaría para obtener todos los 
-- sitios que posee client = 10?
select * from sites
join clients on clients.client_id=sites.client_id
where sites.client_id=10

-- 4. ¿Qué consulta ejecutaría para obtener el número total de sitios creados 
--por mes por año para el cliente con una identificación de 1?
-- ¿Qué pasa con el cliente = 20?
select  *
from sites
where client_id=1 ;

select  month(created_datetime),YEAR(created_datetime)
from sites
where client_id=1;

select YEAR(created_datetime),COUNT(YEAR(created_datetime)) 
from sites
where client_id=1 
group by year(created_datetime);

select  month(created_datetime),YEAR(created_datetime),COUNT(YEAR(created_datetime)) 
from sites
where client_id=1 
group by year(created_datetime),month(created_datetime);


-- 5. ¿Qué consulta ejecutaría para obtener el número total de clientes potenciales  generados
--  para cada uno de los sitios entre el 1 de enero de 2011 y el 15 de febrero de 2011?



select  sites.domain_name,Date_format(registered_datetime,'%M-%d-%y') fecha, count(leads_id) numero_de_leads
from leads
inner join sites on sites.site_id=leads.site_id
where  leads.registered_datetime between  '2011/01/01' and '2011/02/15'	
group by sites.domain_name

-- 6. ¿Qué consulta ejecutaría para obtener una lista de nombres de clientes y 
-- el número total de clientes potenciales que hemos generado para cada uno de 
-- nuestros clientes entre el 1 de enero de 2011 y el 31 de diciembre de 2011?

select concat(clients.first_name,' ',clients.last_name) nombre_cliente, count(leads_id) numero_de_leads 
from clients
left join sites on  clients.client_id= sites.client_id
left join leads on sites.site_id = leads.site_id
where  leads.registered_datetime between  '2011/01/01' and '2011/12/31'	
group by clients.client_id
order by clients.client_id;

-- 7. ¿Qué consulta ejecutaría para obtener una lista de nombres de clientes y 
-- el número total de clientes potenciales que hemos generado para cada cliente 
-- cada mes entre los meses 1 y 6 del año 2011?

select concat(clients.first_name,' ',clients.last_name) nombre_cliente, count(leads_id) numero_de_leads , monthname(registered_datetime) meses
from clients left join sites on  clients.client_id= sites.client_id
left join leads on sites.site_id = leads.site_id
where  leads.registered_datetime between  '2011/01/01' and '2011/06/30'	
group by leads.leads_id

-- 8. ¿Qué consulta ejecutaría para obtener una lista de nombres de clientes y el número total
-- de clientes potenciales que hemos generado para cada uno de los sitios de nuestros clientes
-- entre el 1 de enero de 2011 y el 31 de diciembre de 2011? Solicite esta consulta por ID de cliente.
-- Presente una segunda consulta que muestre todos los clientes, los nombres del sitio y el número total
-- de clientes potenciales generados en cada sitio en todo momento.

select concat(clients.first_name,' ',clients.last_name) nombre_cliente,sites.domain_name,count(leads_id) numero_de_leads , registered_datetime 
from clients left join sites on  clients.client_id= sites.client_id
left join leads on sites.site_id = leads.site_id
where  leads.registered_datetime between  '2011/01/01' and now()
group by sites.domain_name
order by clients.client_id asc;

select concat(clients.first_name,' ',clients.last_name) nombre_cliente,sites.domain_name,count(leads_id) numero_de_leads , registered_datetime 
from clients left join sites on  clients.client_id= sites.client_id
left join leads on sites.site_id = leads.site_id
where  leads.registered_datetime between  '2011/01/01' and '2011/12/31'	
group by sites.domain_name
order by clients.client_id asc; -- revisar por que que no estoy seguro del resultado !! Preguntar al Profe

-- 9. Escriba una sola consulta que recupere los ingresos totales recaudados 
-- de cada cliente para cada mes del año. Pídalo por ID de cliente.

select sum(amount) Total, count(month(billing.charged_datetime)) As Transacciones, clients.first_name, clients.last_name,  YEAR(billing.charged_datetime)Año, monthname(billing.charged_datetime) Mes
from billing 
join clients on billing.client_id = clients.client_id
group by billing.billing_id; --corregida por Lissbeth

-- 10. Escriba una sola consulta que recupere todos los sitios que posee cada cliente. 
-- Agrupe los resultados para que cada fila muestre un nuevo cliente. 
-- Se volverá más claro cuando agregue un nuevo campo llamado 'sitios' que tiene todos los 
-- sitios que posee el cliente. (SUGERENCIA: use GROUP_CONCAT)


select YEAR(created_datetime)Año,COUNT(YEAR(created_datetime))Total_Sitios, clients.client_id,concat(clients.first_name,' ' , clients.last_name) Nombre_Clientes, group_concat(sites.domain_name)Sitios
from sites
join clients on clients.client_id = sites.client_id
group by clients.client_id; 
