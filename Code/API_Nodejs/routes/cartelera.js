const express = require("express");
const { pool } = require("mssql");
const router = express.Router();
const conn = require('../conection');
//var sql = require("mssql");


router.get('/cartelera', (req, res) => {
    // GET_CARTELERA
    const sql = "EXECUTE GET_CARTELERA";
    console.log (conn.connect());
    /*const query = conn.query(sql, (err, results) => {
        if (err) {
            res.send([]);
        } else {
            res.send(results);
        }
    });*/
    /*sql.connect(conn.credentials, function(err){
        if(err){ 
            console.log(err);
            res.send([]);
        }
        var request = new sql.Request()
        request.query(sqlQuery, function(err, recordset){
            if(err){ 
                console.log(err);
                res.send([]);
            }
            res.send(recordset);
        });
    });*/

    res.send("ok..!!!");
});


module.exports = router;