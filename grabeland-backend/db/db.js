const mariadb = require('mariadb');
const pool = mariadb.createPool({
     host: 'localhost', 
     user:'root', 
     password: 'flies44',
     database: 'grabelandDev',
     connectionLimit: 5
});
 
module.exports = Object.freeze({
  pool: pool
});
