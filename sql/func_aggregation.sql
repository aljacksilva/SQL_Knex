-- Aggregation register with MAX, MIN, AVG(average)
SELECT 
MAX(salary) as max_salary,
MIN(salary) as min_salary,
AVG(salary) as media_salary,
SUM(salary) as sum_salary,
COUNT(salary) as count_salary 
from users
WHERE first_name = 'Carly'; 

SELECT 
MAX(u.salary) as max_salary,
MIN(u.salary) as min_salary,
AVG(u.salary) as media_salary,
SUM(u.salary) as sum_salary,
COUNT(u.id) as total 
from users as u
left join profiles as p
on p.user_id = u.id 
GROUP BY u.first_name 
ORDER BY total DESC;