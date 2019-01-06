use sakila;

/* 4.1 */
select count(customer_id) from customer;

/* 4.2 */
select customer_id, count(*) as nArriendos from rental group by customer_id order by nArriendos DESC;

/* 4.3 */
SELECT MAX(total) FROM (SELECT customer_id,count(*) as total FROM rental GROUP BY customer_id) as t1;
/* Esta consulta entrega la maxima cantidad de arriendos hechos por un solo cliente */

/* 4.4 */
/* Una sub-consulta es la forma de encadenar querys en una sola instruccion SQL */

/* 4.5 */
select staff_id, count(*) as nTransacciones from payment group by staff_id;

/* 4.6 */
select staff_id, count(*) as nTransacciones from payment where payment_date between "2005-08-23" and "2005-08-24" group by staff_id order by nTransacciones DESC limit 1;


/* 5.1 */
select film.title as Titulo_Pelicula, language.name as Nombre_Idioma from film inner join language on film.language_id = language.language_id;


/* 5.2 */
select first_name, last_name from customer inner join rental on customer.customer_id = rental.customer_id inner join inventory on inventory.inventory_id = rental.inventory_id inner join film on inventory.film_id = film.film_id  where film.title = "CHICAGO NORTH";

/* 5.3 */
select first_name, last_name, city from customer inner join address on customer.address_id = address.address_id inner join city on address.city_id = city.city_id order by city;


/* 5.4 */
select count(*) as nVecesArrendada, title as Titulo_Pelicula from film inner join inventory on film.film_id = inventory.film_id inner join rental on inventory.inventory_id = rental.inventory_id group by film.film_id order by nVecesArrendada DESC;


/* 5.5 */
select sum(amount) as volumenGanado, title from payment inner join rental on payment.rental_id = rental.rental_id inner join inventory on rental.inventory_id = inventory.inventory_id inner join film on inventory.film_id = film.film_id group by film.film_id order by volumenGanado DESC;

/* 5.6 */
select sum(amount) as Pagado, first_name, last_name from (payment inner join customer on customer.customer_id = payment.customer_id) where amount > 10 group by customer.customer_id order by Pagado DESC;

/* Pablo Saez Parra */
