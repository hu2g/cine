var sql = require("rest-mssql-nodejs");

const conn = new sql({
    user: 'sa',
    password: '1234',
    server: 'localhost',
    database: 'cine',
});

/*
setTimeout(async () => {
    const r = await conn.executeQuery("select * from category");
    console.log(r);
}, 1500);
*/

module.exports = conn;