-- List the titles and release dates of movies released between 1983-1993 in reverse chronological order.

SELECT title, release_date FROM movielens.movies
WHERE release_date BETWEEN '1983-01-01' AND '1993-12-31'
ORDER BY release_date DESC;


-- Without using LIMIT, list the titles of the movies with the lowest average rating.

-- WITHOUT NESTING
SELECT title, AVG(rating) as 'Average Rating'
FROM movielens.movies m
INNER JOIN movielens.ratings r ON r.id = m.id
GROUP BY title
HAVING avg(rating) = 1;

-- WITH NESTING
SELECT title, Avg(rating) AS 'Average Rating'
FROM movielens.movies m
INNER JOIN movielens.ratings r ON r.id = m.id
WHERE rating =(
    SELECT Avg(rating) AS 'Average Rating'
    FROM movielens.movies m
    HAVING Avg(Rating)=1
)
GROUP BY title;


-- List the unique records for Sci-Fi movies where male 24-year-old students have given 5-star ratings.

SELECT DISTINCT * FROM movielens.genres g
	INNER JOIN movielens.genres_movies gm ON gm.genre_id = g.id
	INNER JOIN movielens.movies m ON m.id = gm.movie_id
	INNER JOIN movielens.ratings r ON r.movie_id = gm.movie_id
	INNER JOIN movielens.users u ON u.id = r.user_id
	INNER JOIN movielens.occupations o ON o.id = u.occupation_id 
WHERE g.name = 'Sci-Fi' and u.gender = 'M' and u.age = '24' and o.name = 'Student' and r.rating = '5';


-- List the unique titles of each of the movies released on the most popular release day.
-- I am interpreteing this as choosing the day (i.e. 1-31) which had the most releases across all years


-- Finds the most popular release day and then in nested query, lists all titles
SELECT day(release_date), COUNT(day(release_date))
FROM movielens.movies 
GROUP BY day(release_date)
ORDER BY COUNT(day(release_date)) DESC
LIMIT 1;
	SELECT DISTINCT title, release_date
	FROM movielens.movies
	WHERE day(release_date) = 1;
    
    
-- Find the total number of movies in each genre; list the results in ascending numeric order.

SELECT g.name, COUNT(DISTINCT title) AS 'Number of Movies In Each Genre'
FROM movielens.movies m
INNER JOIN movielens.genres_movies gm ON m.id = gm.movie_id
INNER JOIN movielens.genres g ON gm.genre_id = g.id
GROUP BY g.name
ORDER BY COUNT(DISTINCT title) ASC;