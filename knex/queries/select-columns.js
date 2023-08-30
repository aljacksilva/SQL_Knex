/* 
SELECT u.email as ue, u.id as ui,u.first_name  as ufn 
FROM users as u;
*/ 

const knex = require('../../knex/config/database');
const select = knex('users as u')
  .select('u.email as uemail', 'u.id as uid');

select.then(data => {
  for (const user of data) {
    console.log(user);
  }
}).catch(e => {
  console.log('ERRO', e.message);
}).finally(() => {
  knex.destroy();
});