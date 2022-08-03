-- Without using LIMIT, list the titles of the movies with the lowest average rating.

SELECT title, AVG(rating) as 'Average Rating'
FROM movielens.movies m
INNER JOIN movielens.ratings r ON r.id = m.id
GROUP BY title
HAVING avg(rating) = 1;
