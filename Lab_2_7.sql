-- SQL Lab Lesson 2.7

USE sakila;
-- 1 question
SELECT category.name as category, count(film_category.film_id) as num_films
from sakila.category
join sakila.film_category
on category.category_id = film_category.category_id
group by category.name;

-- 2 question
SELECT staff.staff_id, SUM(payment.amount) AS total_amount
FROM sakila.staff
JOIN sakila.payment 
ON staff.staff_id = payment.staff_id
WHERE payment.payment_date >= "20050801" and payment.payment_date < "20050901"
GROUP BY staff.staff_id;

-- 3 question 
SELECT d.actor_id, a.first_name, COUNT(film.film_id) AS film_count
FROM sakila.film_actor d
JOIN sakila.film 
ON d.film_id = film.film_id
JOIN sakila.actor a
ON d.actor_id = a.actor_id
GROUP BY d.actor_id, a.first_name
ORDER BY film_count DESC
LIMIT 1;

-- 4 question
SELECT c.customer_id, c.first_name, COUNT(r.rental_id) AS Total_Rental
FROM sakila.rental r
JOIN sakila.customer c ON c.customer_id = r.customer_id
GROUP BY c.customer_id, c.first_name
ORDER BY Total_Rental DESC
LIMIT 1;

-- 5 question
SELECT staff_id, first_name, last_name, a.address
FROM sakila.staff s
JOIN sakila.address a ON a.address_id = s.address_id
GROUP BY s.staff_id, s.first_name;

-- 6 question
SELECT f.film_id, f.title, COUNT(fa.actor_id) AS num_actors
FROM sakila.film f
JOIN sakila.film_actor fa ON f.film_id = fa.film_id
JOIN sakila.actor a
GROUP BY f.film_id, f.title;

-- 7 question
SELECT p.customer_id, c.last_name, SUM(p.amount) AS "total_amount_client"
FROM sakila.payment p
JOIN sakila.customer c ON p.customer_id = c.customer_id
GROUP BY p.customer_id, "total_amount_client", c.last_name
ORDER BY last_name ASC;