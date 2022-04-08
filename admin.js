var serviceAccount = {
    "type": "service_account",
    "project_id": "malikkurosaki1985",
    "private_key_id": "69c5d5c8f4b5bf9e9eb86edf749a87057da16d51",
    "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQC8rDeO64fDbTGn\njdQpBxgQ/INUmEE3bFFAiTtcmxTGMzeXOLA1QWVkuaG4sMdn4m5whGL9yEIwTPWo\nnqc+PSZxSesh7cI/cpz7P6yh1IvCBh4SnAEISKZPivU2YFCpUsWabSt/aMHXyjhN\nJ4FzrCgyeZsgMdDhoSJ/HpnTt2kH1frYT/CJFvMbjNViGh/domyg/whfhQgvc2Os\nk0MgCHgGQrFtH4UAi/uV+9sjhLpbX1hDXGMN35x3JY9NeexsUc5kmbD+7l0B8PO9\nW/60J9VPyoSTZ9QYIsye4Oy7C6EXhqldC1wTN4Pqj0zDjkI4qAq8t010fC7zyImM\naV05baHPAgMBAAECggEAEba1jKSOXYm99LY7KhLxbn7WsbWNwe9YfY+k1B/3Rlh+\nqqL24DkglOFczqNCRX2b0tKLHLqVhEVldwxWNWC2YEKJYekZqK1REcG7qoHzESdT\n4XlmG2n+u08XkKBgUlVkGgiP4elq8aCZwpyn6b1LFNoX92DV9KkVPQwZcygwIz0J\nhLHOMlHZd5qa71F7gFuE80jU2Zlt2FswByPeMqY7KOgqf3cNfcktmgeRFy7ZXQcI\n/alnSKaZESJ+OEwDcHNpQZTXRzPMSuisQnHYwrjSYsP4kR29PE534CI/HsQ9EVO7\nv0wKHWIiZ32MMRuv4dxNvSXXgRCOxR6oIyLnkYdKyQKBgQDhwDxcrYlt6pFYgbp3\nOP4420R6R1CDcWeDmpCylD3yFvJsHtSU34Ixlp2LClyBRGBG0+jE9SAzRFZJVinh\nhKlKK+Rsij/gojcAelbcwEpSOrkF/1TBrqWOEOI6CJlw1qDwODJWhe6huXvcvMpV\nctc8eDhqTelvcqLZTX7GGX8rRQKBgQDV9B2b7IaqCP8LIS2SrpWV+FSS5yPw4nM1\nOT+gtYufjuZIu5wSK1QfUn1Yg1Zh86gR3TDtBT1SU5JZB7y6S5n3eDxom/7uQs/T\n7YQQKc29LlmKrpsw8uI2v9VffC1hKIZRdhIrunVJI85CsMV29tHHgjbh3WLd49we\nbSN6RiGgAwKBgQCq2M9V3EeLleAVuWgi3lEXOmoimGIIeAS9BnbHj4Up98/Tn6mG\nWXiwiqoEFf1YHyU1tR4OIO0Tn34l1j2v3LQ52+ntcttQ57L0e6HNQwF8JdDtBwVf\n5wqH76MmBGgLi4MVCZKfBJFKd5OTxJTkAht+OgWH/hrSK1GvXwS4a4dgeQKBgQDU\n08jAWkB61AggYhibWN+kFyrKFvNBo4FG6HPKwczqI5QftcBCsqczoTLe4YcEWQRP\nAOCyZgvh4RArT+8Ewj+eVBSDWun0yLFD93jvOyZVkc2wjpAB2Rn9rEXsffIGO/Gh\nBvp8VTZmUx/SZ1WGSW/ULku50ieO4iMMgTRRZYH9UQKBgH8eGsXVGIoT7LxVXF47\n6Sduw4IHhLRVT5ra/hOpLw3oyIgH1bXNo4fsJWN5Cbu3xEve7Hs6kcw5/rXKSIG9\ntHQh8BxwAPSMbPAcImYAfvoi4I2BTRI+mlgi0EnwGkHyoff2jUfkQkMx2Cb8RpLl\niSxasVwEJDwLv8KLvSTgcZ7r\n-----END PRIVATE KEY-----\n",
    "client_email": "firebase-adminsdk-gdzr0@malikkurosaki1985.iam.gserviceaccount.com",
    "client_id": "113494298700719208060",
    "auth_uri": "https://accounts.google.com/o/oauth2/auth",
    "token_uri": "https://oauth2.googleapis.com/token",
    "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
    "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/firebase-adminsdk-gdzr0%40malikkurosaki1985.iam.gserviceaccount.com"
}

var admin = require("firebase-admin");
admin.initializeApp({
    credential: admin.credential.cert(serviceAccount),
    databaseURL: "https://malikkurosaki1985.firebaseio.com"
});

console.log("muali");
const db = admin.database()
const event = require('events');
const ev = new event.EventEmitter();
const colors = require('colors');

ev.on('send', (data) => {
    console.log(data);
})

db.ref("/malik").on("child_added", (snapshot) => {
    let data = "";
    data +="from:       " + snapshot.val().from + "\n";
    data +="message:    " + snapshot.val().message + "\n";
    data +=snapshot.val().time + "\n";
    data +="-----------------------------------------------------\n";
   console.log(data.green);
})

// db.ref("/88CEEDA9-121B-47BB-AB84-BB6C65CA537B").push({
//     from: "admin",
//     message: "hello",
//     time: "2020-01-01"
// }).then(function () {
//     console.log("success")
//     process.exit()
// })


