SELECT m.movieid, m.title, avg(r.rating) rating, count(r.rating) votes 
FROM movielens.movies m 
JOIN movielens.ratings r on m.movieid = r.movieid 
group by m.movieid, m.title 
having count(r.rating) > 1000 
order by rating desc 
limit 5; 