-- INNER JOIN - joins two tables showing their values
-- LEFT JOIN - show values of tables left and some register of table right
-- RIGHT JOIN is similar of LEFT JOIN bus do the opposite
SELECT u.id as uid , p.id as pid,
p.bio, u.first_name  
FROM users as u
inner join profiles p
on u.id = p.user_id; 

-- Uniting tables (users, users_roles, profiles and roles)
SELECT u.id as uid, u.first_name, p.bio, r.name as role_name  
from users as u
left join profiles as p on u.id  = p.user_id
INNER JOIN user_roles as ur on u.id  = ur.user_id
INNER JOIN roles as r on ur.role_id  = r.id
ORDER BY uid ASC;
