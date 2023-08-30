use base_de_dados;
show tables;
describe users;
INSERT INTO users 
(first_name, last_name, email, password_hash) values 
("Maryah", "Carey", "maryah@email.com", "c"),
("Luke", "Silva", "luke@email.com", "d"),
("Harry", "Styles", "harry@email.com", "e");

-- Insert into in roles
INSERT INTO roles (name)
values
('POST'),('PUT'),('DELETE'),('GET');
INSERT INTO user_roles (user_id, role_id)
values
(110, 4);

SELECT user_id, role_id from user_roles WHERE 
user_id  = 110 and role_id  = 4;

SELECT id, 
(SELECT id from roles order by RAND()  limit 1) as anything 
from users;

INSERT INTO  user_roles  (user_id, role_id)
SELECT id, 
(SELECT id from roles order by RAND()  limit 1) as anything 
from users;

-- INSERT SELECT
-- insert valuer in one table use other  
insert INTO  profiles 
(bio, description, user_id)
select 
CONCAT('Bio of ', first_name),
CONCAT('Description of ', first_name),
id from users;

-- Insert users_roles with many permissions
INSERT ignore  user_roles  (user_id, role_id)
SELECT id, 
(SELECT id from roles order by RAND()  limit 1) as anything 
from users order by RAND() LIMIT 50;