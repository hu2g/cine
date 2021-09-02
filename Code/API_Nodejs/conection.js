var sql = require("mssql");

// credentials for your database
//const conn = new sql.ConnectionPool({
const config ={
    user: 'DESKTOP-L0O2DCR\Huriel Gómez',
    password: '',
    server: 'DESKTOP-L0O2DCR',
    database: 'cine',
    port: 1433,
    options:{
        enableArithAbort:true
    },
    connectionTimeout: 3000,//150000,
    pool:{
        max: 10,
        min: 0,
        idleTimeoutMillis: 30000
    }
}
    //});

sql.on('error', err => {
    console.log(err.message)
});

async function getConsulta(){
    try {
        let pool = await sql.connect(config);
        let result1 = await pool.request().query("select * from movie");
        console.log(result1);
        sql.close();
    } catch (error) {
        console.log(error.message);
        sql.close();
    }
    console.log("fin")
}

console.log(getConsulta());


/*function myQuery(query){
    sql.connect(credentials, function(err){
        if(err){ 
            console.log(err);
            return err;
        }
        var request = new sql.Request()
        request.query(query, function(err, recordset){
            if(err){ 
                console.log(err);
                return err;
            }
            return recordset;
        });
    });
}
*/
//module.exports = conn;
