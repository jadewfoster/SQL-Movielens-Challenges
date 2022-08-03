-- List the unique records for Sci-Fi movies where male 24-year-old students have given 5-star ratings.

SELECT DISTINCT * FROM movielens.genres g
INNER JOIN movielens.genres_movies gm ON gm.genre_id = g.id
INNER JOIN movielens.movies m ON m.id = gm.movie_id
INNER JOIN movielens.ratings r ON r.movie_id = gm.movie_id
INNER JOIN movielens.users u ON u.id = r.user_id
INNER JOIN movielens.occupations o ON o.id = u.occupation_id 
WHERE g.name = 'Sci-Fi' and u.gender = 'M' and u.age = '24' and o.name = 'Student' and r.rating = '5';