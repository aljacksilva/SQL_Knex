/* 
-- LIMIT (limit one amount of values)
-- OFFSET move the cursor to show the results
SELECT id, first_name, email as uemail from users u 
WHERE id  BETWEEN  100 AND 150
ORDER BY  id ASC 
LIMIT 2,4;
*/
const knex = require('../../knex/config/database');
const select = knex('users')
  .select('id',  'first_name')
  .orderBy('id', 'asc')
  .limit(5)
  .offset(10);

console.log(select.toString());

select.then((data) => {
  console.log(data);
}).catch((e) => {
  console.log(e.message);
}).finally(() => {
  knex.destroy();
});