-- 1) Insira 5 usuários
INSERT INTO users (
    first_name,
    last_name,
    email,
    password_hash
  )
VALUES (
    "Bryan",
    "Mayo",
    "vitadiam@consectetueripsum.ca",
    "QLN12H3RL"
  ),
(
    "Jheniffer",
    "Stewart",
    "nh.sit@nunc.edu",
    "ROM35HMMA"
  ),
(
    "Fers",
    "Hall",
    "nequorbi@porttitorscelerisqueneque.edu",
    "YTU15GQRT"
  ),
(
    "Jacobison",
    "Manning",
    "rus.at@sociis.edu",
    "EQS93HLI6"
);

UPDATE users  set salary = round(RAND() * 100000, 2)
WHERE id in (218, 219, 220, 221); 

-- 2) Insira 5 perfís para os usuários inseridos
insert INTO  profiles 
(bio, description, user_id)
values ('One bio', 'One description', (select id from users WHERE id = 218)),
('One bio', 'One description', (select id from users WHERE id = 219)),
('One bio', 'One description', (select id from users WHERE id = 220)),
('One bio', 'One description', (select id from users WHERE id = 221));


-- 3) Insira permissões (roles) para os usuários inseridos
INSERT INTO user_roles (user_id, role_id) values
(
	(select id from users WHERE id = 218),
	(select id from roles WHERE name = 'PUT')
),
(
	(select id from users WHERE id = 219),
	(select id from roles WHERE name = 'PUT')
),
(
	(select id from users WHERE id = 220),
	(select id from roles WHERE name = 'PUT')
),
(
	(select id from users WHERE id = 221),
	(select id from roles WHERE name = 'PUT')
),
(
	(select id from users WHERE id = 221),
	(select id from roles WHERE name = 'POST')
),
(
	(select id from users WHERE id = 221),
	(select id from roles WHERE name = 'GET')
);

-- 4) Selecione os últimos 5 usuários por ordem decrescente
SELECT * from users order by id DESC limit 5;

-- 5) Atualize o último usuário inserido
UPDATE users set first_name = 'Bryan', 
last_name = 'Maykon' WHERE id = 218;

-- 6) Remova uma permissão de algum usuário
DELETE FROM user_roles WHERE 
user_id = 221 AND role_id = 3;

-- 7) Remova um usuário que tem a permissão "PUT"
-- SELECT u.id as uid, u.first_name
delete u 
from users u 
inner join user_roles ur on u.id = ur.user_id 
inner join roles r on ur.role_id = r.id 
WHERE r.name  = 'PUT' and u.id = 220;

-- 8) Selecione usuários com perfís e permissões (obrigatório)
SELECT u.id as uid, u.first_name, p.bio
from users u 
inner join user_roles ur on u.id = ur.user_id 
inner join roles r on ur.role_id = r.id
inner join profiles p on p.user_id = u.id; 

-- 9) Selecione usuários com perfís e permissões (opcional)
SELECT u.id as uid, u.first_name, p.bio
from users u 
left join user_roles ur on u.id = ur.user_id 
left join roles r on ur.role_id = r.id
left join profiles p on p.user_id = u.id; 

-- 10) Selecione usuários com perfís e permissões ordenando por salário
SELECT u.id as uid, u.first_name, p.bio, u.salary 
from users u 
inner join user_roles ur on u.id = ur.user_id 
inner join roles r on ur.role_id = r.id
inner join profiles p on p.user_id = u.id
order by u.salary  desc; 
