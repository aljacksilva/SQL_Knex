-- DELETE (delete registers of table)
-- Use SELECT to guarantee that is delete of values corrects
DELETE FROM users WHERE  id = 114;
SELECT * FROM  users u WHERE  id BETWEEN 110 AND 115; 

-- UPDATE (update registers)
update users  SET first_name = 'Jean',
last_name = 'Miranda'
WHERE id  = 199;
SELECT * FROM  users  WHERE id  = 199;

-- Set a random salary of users
UPDATE users  set salary = ROUND(RAND() * 10000, 2);
SELECT salary from users WHERE 
salary  BETWEEN 1000 and 1500
ORDER BY  salary ASC;

-- Updating with JOIN user 'Oprah'
update users as u
join profiles p 
ON p.user_id = u.id
set p.bio = CONCAT(p.bio, ' updated') 
WHERE u.first_name  = 'Oprah';

-- Erasing 'bio' of user 'Oprah' with join
DELETE p from users u
join profiles as p 
ON p.user_id = u.id
WHERE u.first_name  = 'Oprah';