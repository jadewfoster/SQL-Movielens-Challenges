-- List the unique titles of each of the movies released on the most popular release day.
-- I am interpreteing this as choosing the day (i.e. 1-31) which had the most releases across all years


-- Finds the most popular release day
SELECT day(release_date), COUNT(day(release_date))
FROM movielens.movies 
GROUP BY day(release_date)
ORDER BY COUNT(day(release_date)) DESC
LIMIT 1;

-- Lists titles
SELECT DISTINCT title
FROM movielens.movies
WHERE day(release_date) = 1
