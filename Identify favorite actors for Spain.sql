--Report the number of movie rentals and the average 
--rating for each actor, separately for male and female customers.
--Report only actors with more than 5 movie rentals.
--Augment the table renting with information about customers and actors.
--Now, report the favorite actors only for customers from Spain.




SELECT a.name,  c.gender,
       COUNT(*) AS number_views, 
       AVG(r.rating) AS avg_rating
FROM renting as r
LEFT JOIN customers AS c
ON r.customer_id = c.customer_id
LEFT JOIN actsin as ai
ON r.movie_id = ai.movie_id
LEFT JOIN actors as a
ON ai.actor_id = a.actor_id
where  c.country = 'Spain'-- Select only customers from Spain
GROUP BY a.name, c.gender
HAVING AVG(r.rating) IS NOT NULL 
  AND COUNT(*) > 5 
ORDER BY avg_rating DESC, number_views DESC;
