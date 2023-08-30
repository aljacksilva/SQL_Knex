/* 
select * from users
where
created_at < '2023-08-21 22:54:38'
and first_name = 'Luke'
and password_hash = 'djioj9876'
*/

const knex = require('../../knex/config/database');
const select = knex('users').select('id', 'first_name')
  .where('id', '=', 10)
  .andWhere('first_name', '=', 'Luke')
  .orWhere('id', '=', 11);

console.log(select.toString());

select.then(data => {
  for (const user of data) {
    console.log(user);
  }
}).catch(e => {
  console.log('ERRO', e.message);
}).finally(() => {
  knex.destroy();
});