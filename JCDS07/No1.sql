SELECT * FROM actor;
SELECT * FROM address;
SELECT * FROM category;
SELECT * FROM city;
SELECT * FROM film;
SELECT * FROM film_actor;
SELECT * FROM film_category;
SELECT * FROM film_text;
SELECT * FROM inventory;
SELECT * FROM language;
SELECT * FROM payment;
SELECT * FROM rental;
SELECT * FROM staff;
SELECT * FROM store;

-- NO 1.1
SELECT f.title,c.name AS category, f.length
FROM category c
JOIN film_category fc
USING (category_id)
JOIN film f
USING (film_id)
WHERE c.name = 'Comedy'
ORDER BY f.length ASC
LIMIT 10;

-- NO 1.2
SELECT * FROM category;
SELECT * FROM payment;
SELECT * FROM film;
SELECT * FROM film_category;

SELECT DISTINCT c.name AS kategori, COUNT(f.title) AS jumlahmovie ,AVG(f.rental_rate) AS rataHargaSewa
FROM film f
JOIN film_category fm
USING (film_id) 
JOIN category c
USING(category_id)
GROUP BY c.name
ORDER BY jumlahmovie DESC;

-- NO 1.3
SELECT * FROM film;
ALTER TABLE film
ADD keterangan Varchar(50)
DEFAULT 'haha';
UPDATE film
SET keterangan = 'General Audiences'
WHERE rating = 'G';
UPDATE film
SET keterangan = 'Parental Guidance Suggested'
WHERE rating = 'PG';
UPDATE film
SET keterangan ='Parental Guidances for Under 13'
WHERE rating = 'PG-13';
UPDATE film
SET keterangan = 'Restricted'
WHERE rating = 'R';
UPDATE film
SET keterangan = 'No Children Under 17 Admintted'
WHERE rating = 'NC-17';
-- Error Code: 1175. You are using safe update mode and you tried to update a table without a WHERE that uses a KEY column.  To disable safe mode, toggle the option in Preferences -> SQL Editor and reconnect.

ALTER TABLE film
DROP COLUMN keterangan;

SELECT DISTINCT rating,
keterangan,
COUNT(rating) AS jumlahMovie
FROM film
GROUP BY rating;

-- CARA 2 1.3
SELECT * FROM film;
SELECT rating,'General Audiences' AS keterangan,COUNT(rating) AS jumlahMovie FROM film WHERE rating = 'G'
UNION
SELECT rating,'Parental Guidance Suggested' AS keterangan,COUNT(rating) AS jumlahMovie FROM film WHERE rating = 'PG'
UNION
SELECT rating,'Parental Guidances for Under 13' AS keterangan,COUNT(rating) AS jumlahMovie FROM film WHERE rating = 'PG-13'
UNION
SELECT rating,'Restricted' AS keterangan,COUNT(rating) AS jumlahMovie FROM film WHERE rating = 'R'
UNION
SELECT rating,'No Children Under 17 Admitted' AS keterangan,COUNT(rating) AS jumlahMovie FROM film WHERE rating = 'NC-17';

-- SELECT customer_id,first_name, 'Bronze' AS type FROM customers WHERE points <2000
-- UNION
-- SELECT customer_id,first_name, 'Silver' AS type FROM customers WHERE points BETWEEN 2000 AND 3000
-- UNION
-- SELECT customer_id,first_name, 'Bronze' AS type FROM customers WHERE points >3000
-- ORDER by type;
-- NO 1.4
SELECT a.actor_id, a.first_name, a.last_name, COUNT(fa.film_id) AS jumlah_Movie
FROM actor a
JOIN film_actor fa
USING (actor_id)
GROUP BY fa.actor_id
ORDER BY jumlah_Movie DESC
LIMIT 10;

-- NO 1.5
SELECT c.name AS category, COUNT(c.name) AS jumlah_Movie
FROM film_actor fa
JOIN film_category fc
USING (film_id)
JOIN category c
USING(category_id)
WHERE fa.actor_id = 107
GROUP BY category;

-- NO 1.6
SELECT f.title, c.name AS category
FROM film_actor fa
JOIN film_category fc
USING (film_id)
JOIN category c
USING(category_id)
JOIN film f
USING(film_id)
WHERE fa.actor_id = 107 AND c.name = 'Sci-Fi';


-- NO 1.7
SELECT a.actor_id,a.first_name,a.last_name,COUNT(c.name) AS jumlah_movie
FROM actor a
JOIN film_actor fa
USING(actor_id)
JOIN film f
USING(film_id)
JOIN film_category fc
USING(film_id)
JOIN category c
USING(category_id)
WHERE c.name = 'Horror'
GROUP BY a.actor_id
ORDER BY jumlah_Movie DESC
LIMIT 10;

-- NO 1.8
SELECT f.title, c.name AS category
FROM film_actor fa
JOIN film_category fc
USING (film_id)
JOIN category c
USING(category_id)
JOIN film f
USING(film_id)
WHERE fa.actor_id = 27 AND c.name = 'Horror';