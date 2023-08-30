/* 
-- DELETE (delete registers of table)
-- Use SELECT to guarantee that is delete of values corrects
DELETE FROM users WHERE  id = 114;
SELECT * FROM  users u WHERE  id BETWEEN 110 AND 115; 
*/
const knex = require('../../knex/config/database');
const select = knex('users').select('id', 'first_name');
const deleteSql = knex('users').delete().whereBetween('id', [30, 35]);

console.log(select.toString());
console.log(deleteSql.toString());

deleteSql.then((data) => {
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