var express = require('express');
var router = express.Router();
var db = require('../db/db');

router.get('/', async (req, res, next) => {
        try {
                if (!req) {
                        //req = true
                }
                console.log(req)
                const result = await db.pool.query("select * from gardens where " ++ req.where);
                res.send(result);
        } catch (err) {
                throw err;
        }

});

module.exports = router;
