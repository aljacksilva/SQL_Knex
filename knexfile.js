module.exports = {

    client: 'mysql2',
    connection: {
      database: 'mysql_knex',
      user:     'root',
      password: 'root'
    },
    pool: {
      min: 2,
      max: 10
    },
    migrations: {
      tableName: 'knex_migrations'
    }
  

};
