-- Find the total number of movies in each genre; list the results in ascending numeric order.

SELECT g.name, COUNT(DISTINCT title) AS 'Number of Movies In Each Genre'
FROM movielens.movies m
INNER JOIN movielens.genres_movies gm ON m.id = gm.movie_id
INNER JOIN movielens.genres g ON gm.genre_id = g.id
GROUP BY g.name
ORDER BY COUNT(DISTINCT title) ASC;
