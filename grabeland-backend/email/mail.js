var nodemailer = require('nodemailer');

var transporter = nodemailer.createTransport({
    host: "rigel.uberspace.de",
    port: 587,
    secure: false,
    auth: {
        user: "booking@future-splendors.eu",
        pass: "rqb@VFM8tkn_mqn-zre"
    },
});

transporter.verify(function (error, success) {
    if (error) {
        console.log(error);
    } else {
        console.log("Server is ready to take our messages");
    }
});

var message = {
    from: "booking@future-splendors.eu",
    to: "globalatmo@gmail.com",
    subject: "Deine Buchung",
    text: ""
};

var text = {
    t1: "Hallo ",
    name: "Unbekannte*r",
    t2: "/nVielen Dank für deine Buchung!/n/nDein Slot is am",
    date: "00.00.21",
    t3: " um ",
    time: "12:00",
    t4: " Uhr. Startpunkt ist ",
    adress: "Stünz-Mölkauer Weg 13",
    t5: "\nBis dann, wir freuen uns auf dich!"
}
function constructText(text) {
    return text.t1 + text.name + text.t2 + text.date + text.t3 + text.time + text.t4 + text.adress +text.t5
}

function personalizeMail(name, email,ticketCode, message) {
   message.to = email;

} 

async function send(ticketNo, email, name, date, time, lang) {
    await transporter.sendMail({
        from: "booking@future-splendors.eu",
        to: email,
        subject: "Deine Buchung (TEST)",
        text: "Hallooo!\nBuchung: " + date + " um " + time + "Uhr.\n" + "Deine Ticketnummer ist: " + ticketNo
    })
}

module.exports= {
    transporter,
    send
}
