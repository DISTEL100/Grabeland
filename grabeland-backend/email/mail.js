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
    t2: ",\n\nVielen Dank für deine Buchung!\nWir freuen uns sehr, dass du Interesse hast unsere Ausstellung zu besuchen. Du erhältst vor deinem Besuch eine digitale Laufkarte und einen Startpunkt, um den Rundgang zu beginnen. Dafür werden wir uns nochmals per Email melden. Du kannst jederzeit Fragen stellen und auch eine Laufkarte in Papierform von den Aufsichtspersonen vor Ort erhalten.\nFür den Besuch musst du einen negativen Corona-Test vorweisen, der nicht älter als 24Std sein darf – auch bei vollständiger Impfung oder Genesung. Bitte beachte während der Begehung die allgemein geltenden Abstandsregeln und verhalte dich respektvoll gegenüber anderen Besucher:innen sowie den Gartenanlagen.\n\nDeine Ticketnummer ist: ",
    ticketNo: "xxxxxxx",
    t3: "\nFalls du dein Ticket stornieren möchtest klicke bitte auf diesen Link: https://handschu.uber.space/storno/",
    t4: "\n\nViel Freude an Grabeland (Future Splendors)!",
}
function constructText(name, ticketNo) {
    return text.t1 + name + text.t2 + ticketNo + text.t3 + ticketNo + text.t4
}

function personalizeMail(name, email, date, time, ticketCode, message) {
    message.to = email;
    let date_f = date.split('-').reverse().join('.')
    console.log(date_f)
    message.subject = "Deine Tour am " + date_f + " um " + time + "Uhr";
    message.text = constructText(name, ticketCode);
    return message
} 

async function send(ticketNo, email, name, date, time, lang) {
    await transporter.sendMail(
        personalizeMail(name, email, date, time, ticketNo, {to: "", from: "booking@future-splendors.eu", subject: "", text: ""})
    )
}

module.exports= {
    transporter,
    send
}
