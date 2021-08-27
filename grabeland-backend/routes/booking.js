var express = require('express');
var router = express.Router();
var db = require('../db/db');
var mail = require('../email/mail')
var crypto = require('crypto')

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

var message = {
    from: "booking@future-splendors.eu",
    to: "globalatmo@gmail.com",
    subject: "Message title",
    text: "Plaintext version of the message",
    html: "<p>HTML version of the message</p>"
};


router.get('/confirm', async (req, res, next) => {
    try {
        let name = req.query["name"];
        let email = req.query["email"];
        let phone = req.query["phone"];
        let date = req.query["date"];
        let timeID = req.query["timeID"];
        let time = req.query["time"];
        let lang = req.query["lang"];
        let ticketNo = crypto.randomBytes(6).toString('hex');
        let result = await db.pool.query("INSERT  into Tickets (TicketID, Owner, EMail, Lang, Phone, TimeSlot) VALUES ( '" +
            ticketNo + 
            "', '" +
            name +
            "', '" +
            email +
            "', '" +
            lang +
            "', '" +
            phone +
            "', " +
            timeID +
            " ) "
        )
        await  mail.send(ticketNo, email, name, date, time, lang)
        res.send(result);
    } catch (err) {
        throw err;
    }
})

router.get('/storno', async (req, res, next) => {
    try {
        let ticketNo = req.query["ticketNo"] 
        let result = await db.pool.query("DELETE FROM Tickets WHERE TicketID = '" + ticketNo + "'")
        res.send(result)
    } catch (err) {
        throw err;
    }
});

module.exports = router;
