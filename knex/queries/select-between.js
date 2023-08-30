/*
SELECT * FROM  users where 
created_at BETWEEN  '2021-06-12 00:00:00'
AND '2021-09-27 23:59:59'
AND id BETWEEN 150 AND 160;
*/

const knex = require('../../knex/config/database');
const selectBetween = knex('users')
  .select('id',  'first_name')
  .whereBetween('id', [80, 83])
  .orWhereBetween('id', [10, 15]);

console.log(selectBetween.toString());

selectBetween.then((data) => {
  console.log(data);
}).catch((e) => {
  console.log(e.message);
}).finally(() => {
  knex.destroy();
});