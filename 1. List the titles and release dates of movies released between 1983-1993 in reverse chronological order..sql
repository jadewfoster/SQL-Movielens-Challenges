-- List the titles and release dates of movies released between 1983-1993 in reverse chronological order.

SELECT title, release_date FROM movielens.movies
WHERE release_date BETWEEN '1983-01-01' AND '1993-12-31'
ORDER BY release_date DESC;
