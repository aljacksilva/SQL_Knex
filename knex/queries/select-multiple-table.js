/*
-- Select users.id, profiles.id, profiles.bio
-- profiles.description, users.first_name
-- from users table and profiles table
-- where the userid is the same as
-- the user_id of profiles

SELECT u.id as uid, p.id as pid,
p.bio, u.first_name 
FROM users as u, profiles as p
WHERE u.id = p.user_id;
*/
const knex = require('../../knex/config/database');
const select = knex(
    knex.raw(
      '?? as ??, ?? as ??',
      ['users', 'u', 'profiles', 'p']
    )
  )
  .select('u.id as uid', 'p.id as pid', 'p.bio', 'u.first_name')
  .where('u.id', '=', knex.raw('??', ['p.user_id']));

console.log(select.toString());

select.then((data) => {
  console.log(data);
}).catch((e) => {
  console.log(e.message);
}).finally(() => {
  knex.destroy();
});