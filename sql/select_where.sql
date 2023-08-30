SELECT u.email as ue, u.id as ui,u.first_name  as ufn FROM users as u;
-- WHERE filter register
-- operators comparation = < <= > >= <> !=
-- oparetors logics AND OR
SELECT * FROM  users where created_at < '2023-08-21 22:54:38' 
and first_name = 'John' and password_hash = 'b';

-- BETWEEN select one range
SELECT * FROM  users where created_at BETWEEN  '2021-06-12 00:00:00'
AND '2021-09-27 23:59:59'
AND id BETWEEN 150 AND 160;

-- IN select elements between the values sent
SELECT * FROM  users where id IN (110,115,120,125,130,1000,12223,13139437892)
AND first_name IN  ('Keelie', 'Luiz');

-- LIKE (% - any thing, _ one caractere)
SELECT * FROM  users WHERE first_name LIKE '%ma%';

-- ORDER (order of values)
SELECT id, first_name, email as uemail from users u 
WHERE id  BETWEEN 100 AND 150 
ORDER BY id  ASC ;

-- LIMIT (limit one amount of values)
-- OFFSET move the cursor to show the results
SELECT id, first_name, email as uemail from users u 
WHERE id  BETWEEN  100 AND 150
ORDER BY  id ASC 
LIMIT 2,4;

-- Select user with JOIN 'Oprah'
SELECT u.first_name, p.bio from users u
join profiles p 
ON p.user_id = u.id
WHERE u.first_name  = 'Oprah';

-- Grouping first_name with more register using COUNT
SELECT first_name, COUNT(id) as total  from users 
group by first_name 
ORDER by total DESC;




