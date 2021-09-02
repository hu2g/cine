const express = require("express");
const router = express.Router();
const conn = require('../conection');

/**
 * GET_CARTELERA
 * Peliculas en cartelera  
 **/ 
router.get('/cartelera', async (req, res) => {
    const sql = "EXECUTE GET_CARTELERA";
    try {
        const table = await conn.executeQuery(sql);
        //console.log(r.data);
        res.send(table.data);    
    } catch (error) {
        console.log("Error: "+error.message);
        res.send([]);
    }
    res.send("ok..!!!");
});

/**
 * FUNCTION_DETAIL
 * Informacion de las funciones en la que se encuentra una pelicula 
 * Parameters:
 * @ID_MOVIE INTEGER: Id de la pelicula
 **/ 
router.get('/fundetail', async (req, res) => {
    const sql = "EXECUTE FUNCTION_DETAIL @id";
    try {
        const { idmovie }= req.query;
        const table = await conn.executeQuery(sql,[{
            name:'id',
            type:'int',
            value: idmovie
        }]);
        //console.log(r.data);
        res.send(table.data);    
    } catch (error) {
        console.log("Error: "+error.message);
        res.send([]);
    }
    res.send("ok..!!!");
});



/**
 * OCCUPIED_SEATS
 * Asientos de la sala ocupados en una funcion
 * Parameters:
 * @ID_FUNCTION INTEGER: Id de la funcion
 */
router.get('/ocupseats', async (req, res) => {
    const sql = "EXECUTE OCCUPIED_SEATS @id";
    try {
        const { idfunction }= req.query;
        const table = await conn.executeQuery(sql,[{
            name:'id',
            type:'int',
            value: idfunction
        }]);
        //console.log(r.data);
        res.send(table.data);    
    } catch (error) {
        console.log("Error: "+error.message);
        res.send([]);
    }
    res.send("ok..!!!");
});



/**
 * ALL_SEAT_CINEMA
 * Todos los asientos de una sala
 * Parameters:
 * @ID_CINEMA INTEGER: Id de la sala
 */
router.get('/allseat', async (req, res) => {
    const sql = "EXECUTE ALL_SEAT_CINEMA @id";
    try {
        const { idsala }= req.query;
        const table = await conn.executeQuery(sql,[{
            name:'id',
            type:'int',
            value: idsala
        }]);
        //console.log(r.data);
        res.send(table.data);    
    } catch (error) {
        console.log("Error: "+error.message);
        res.send([]);
    }
    res.send("ok..!!!");


});


module.exports = router;