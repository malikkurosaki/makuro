_chat() {
    dir="$(npm root -g)"
    data='

const dir = "'$dir'"
const color = require(dir+"/colors")

var info = "Chat Chit Chut\n";
info +="----------------\n";
info += "SELAMAT DATANG\n";
info += "----------------\n";
info += "masukkan nama room,\nmasukkan nama user,\n q | CTRL+q untuk keluar\n\n";
info += "malikkurosaki@2022 v001\n";
console.log(info.cyan)

'$service_account'

var admin = require(dir+"/firebase-admin");
admin.initializeApp({
    credential: admin.credential.cert(serviceAccount),
    databaseURL: "https://malikkurosaki1985.firebaseio.com"
});

const db = admin.database();

const readline = require("readline").createInterface({
    input: process.stdin,
    output: process.stdout
});

async function room() {
    return new Promise((resolve, reject) => {
        readline.question("Room name: ", (answer) => {
            room = answer;
            resolve(room);
        })
    })
}

async function user() {
    return new Promise((resolve, reject) => {
        readline.question("User name: ", (answer) => {
            user = answer;
            resolve(user);
        })
    })
}

function send(rm) {
    readline.question("Message: ", (answer) => {
        if (answer == "q") {
            console.log("Bye...".yellow);
            process.exit();
        }
        db.ref(`/rooms/${rm}`).push({
            user: user,
            message: answer,
            time: Date.now().toLocaleString()
        }).then(() => {
            send(rm);
        })

    })
}

; (async () => {
    let rm = await room();
    let us = await user();

    let ref = db.ref("/rooms/"+rm);
    ref.on("child_added", (snapshot) => {
        let data = snapshot.val();
        let pesan = ""
        pesan += "from: "+data.user+"\n";
        pesan += "message:"+data.message+"\n";
        pesan += data.time+"\n";
        pesan += "----------------------------------------\n"
        console.log(data.user == us ? pesan.green : pesan.yellow);
    })

    send(rm);

})();

'
    node -e "$data"
}
