/*
INSERT INTO users 
(first_name, last_name, email, password_hash) values 
("Maryah", "Carey", "maryah@email.com", "c"),
("Luke", "Silva", "luke@email.com", "d"),
("Harry", "Styles", "harry@email.com", "e");
*/

const knex = require('../../knex/config/database');
const data = [
  {
    first_name: 'Maryah',
    last_name: 'Carey',
    email: 'maryah@email.com',
    password_hash: 'cadsdwq1',
    salary: 2625.9
  },
  {
    first_name: 'Luke',
    last_name: 'Silva',
    email: 'luke@email.com',
    password_hash: 'djioj9876',
    salary: 98879
  },
  {
    first_name: 'Harry',
    last_name: 'Styles',
    email: 'harry@email.com',
    password_hash: 'cklkl8787',
    salary: 264.9
  },
];
const insert = knex('users').insert(data);

// console.log(insert.toString());
// console.log(insert.toSQL().toNative());

insert.then(data => {
  console.log(data);
}).catch(e => {
  console.log('ERRO', e.message);
}).finally(() => {
  knex.destroy();
});