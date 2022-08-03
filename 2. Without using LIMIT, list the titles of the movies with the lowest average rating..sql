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
