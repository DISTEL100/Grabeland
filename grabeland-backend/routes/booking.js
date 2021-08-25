var express = require('express');
var router = express.Router();
var db = require('../db/db');

router.get('/timeslots', async (req, res, next) => {
        try {
                const result = await db.pool.query("select * from TimeSlots");
                res.send(result);
        } catch (err) {
                throw err;
        }
});

router.get('/freeseats', async (req, res, next) => {
        try {
                const result = await db.pool.query("SELECT sum(FreeTickets) as Sum, DATE_FORMAT( od.`Date`, '%d.%m') as Date FROM TimeSlots ts JOIN OpenDays od ON od.ID = ts.OpenDay GROUP BY ts.OpenDay; ");
                res.send(result);
        } catch (err) {
                throw err;
        }
})

router.get('/slots', async (req, res, next) => {
        try {
                const date = req.query["date"];
                console.log(date)
                const result = await db.pool.query("SELECT DATE_FORMAT(od.`Date`, '%d.%m') as Date, TIME_FORMAT(ts.StartTime, '%H:%i') as Time, FreeTickets, ts.ID FROM TimeSlots ts JOIN OpenDays od ON od.ID = ts.OpenDay WHERE Date = '" + date + "'");
                res.send(result);
        } catch (err) {
                throw err;
        }
})

module.exports = router;
