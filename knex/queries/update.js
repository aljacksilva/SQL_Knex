/* 
-- UPDATE (update registers)
update users  SET first_name = 'Jean',
last_name = 'Miranda'
WHERE id  = 199;
SELECT * FROM  users  WHERE id  = 199;
*/
const knex = require('../../knex/config/database');
const select = knex('users').where('id', '=', 29);
const update = knex('users').where('id', '=', 29).update({
  first_name: 'Luiz',
  last_name: 'Miranda'
});

console.log(select.toString());
console.log(update.toString());

update.then((data) => {
  console.log(data);

  select.then((data) => {
    console.log(data);
  }).catch((e) => {
    console.log(e.message);
  });
}).catch((e) => {
  console.log(e.message);
}).finally(() => {
  knex.destroy();
});