USE sakila;

# Challenge 1
# 1. You need to use SQL built-in functions to gain insights relating to the duration of movies:
# 1.1 Determine the shortest and longest movie durations and name the values as max_duration and min_duration.
# 1.2. Express the average movie duration in hours and minutes. Don't use decimals.
# Hint: Look for floor and round functions.

SELECT MAX(length) AS max_duration, MIN(length) AS min_duration
FROM sakila.film;

SELECT title, length,
CONCAT(
    length DIV 60,  -- Get the hours part
    ' hours ',
    length %60,    -- Get the remaining minutes part
    ' minutes'
  ) AS converted_time
FROM film;

# 2.1 Calculate the number of days that the company has been operating.
# Hint: To do this, use the rental table, and the DATEDIFF() function to subtract the earliest date in the rental_date column from the latest date.
SELECT DateDiff(MAX(rental_date), MIN(rental_date)) AS days_operating
FROM sakila.rental;

# 2.2 Retrieve rental information and add two additional columns to show the month and weekday of the rental. Return 20 rows of results.
SELECT *,MONTH(rental_date) AS rental_month, WEEKDAY(rental_date) AS rental_weekeday
FROM sakila.rental
Limit 20;

# 3. You need to ensure that customers can easily access information about the movie collection. 
# To achieve this, retrieve the film titles and their rental duration. If any rental duration value is NULL, replace it with the string 'Not Available'. 
# Sort the results of the film title in ascending order.
SELECT title, IFNULL(rental_duration,'Not Available') AS updated_duration
FROM sakila.film
ORDER BY title ASC;


# Challenge 2
# 1. Next, you need to analyze the films in the collection to gain some more insights. Using the film table, determine:
# 1.1 The total number of films that have been released.
SELECT COUNT(film_id)
FROM sakila.film;

# 1.2 The number of films for each rating.
SELECT COUNT(film_id), rating
FROM sakila.film
GROUP BY rating
ORDER BY rating ASC;

# 1.3 The number of films for each rating, sorting the results in descending order of the number of films. 
# This will help you to better understand the popularity of different film ratings and adjust purchasing decisions accordingly.
SELECT COUNT(film_id), rating
FROM sakila.film
GROUP BY rating
ORDER BY COUNT(film_id) DESC;

# Using the film table, determine:
# 2.1 The mean film duration for each rating, and sort the results in descending order of the mean duration. 
# Round off the average lengths to two decimal places. This will help identify popular movie lengths for each category.
SELECT AVG(length),rating
FROM sakila.film
GROUP BY rating
ORDER BY AVG(length) DESC;

# 2.2 Identify which ratings have a mean duration of over two hours in order to help select films for customers who prefer longer movies.
SELECT AVG(length),rating
FROM sakila.film
GROUP BY rating
HAVING AVG(length) >120
ORDER BY AVG(length) DESC;



SELECT *
FROM sakila.film;

SHOW Tables;


