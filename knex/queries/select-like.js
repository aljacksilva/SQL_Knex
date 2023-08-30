/* 
-- LIKE (% - any thing, _ one caractere)
SELECT * FROM  users WHERE first_name LIKE '%ma%';
*/
const knex = require('../../knex/config/database');
const select = knex('users')
  .select('id',  'first_name')
  .where('first_name', 'like', '___')
  .orWhere('first_name', 'like', '%na');

console.log(select.toString());

select.then((data) => {
  console.log(data);
}).catch((e) => {
  console.log(e.message);
}).finally(() => {
  knex.destroy();
});