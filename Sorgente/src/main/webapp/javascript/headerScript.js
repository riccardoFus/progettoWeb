// Aggiorna la frase nell'intestazione delle pagine ogni 20 secondi
function updatePhrase() {
    let jsonObject;
    let URL = window.location.origin + '/' + window.location.pathname.split('/')[1] + '/PhraseFetcher';
    let xhttp = new XMLHttpRequest();

    xhttp.open("GET", URL, true);
    xhttp.responseType = "json";

    xhttp.onreadystatechange = function () {
        let done = 4, ok = 200;
        if (this.readyState === done && this.status === ok) {
            jsonObject = this.response;

            document.getElementById("phraseHeader").innerText =
                jsonObject.frase;
        }
    };

    xhttp.send();
}

updatePhrase();
window.setInterval(updatePhrase, 20000);


/* Script ser tenere slezionata la parte di pagina dove ti trovi nell'header*/

let pos = 0
//togli session id se presente
let noSessionId = window.location.pathname.split(";")[0];
let path = noSessionId.split("/")[2];

switch (path) {
    case "Home.jsp":
        pos = 0
        break;

    case "ChiSiamo.jsp":
        pos=1
        break;
    case "Attivita.jsp":
        pos=2
        break;
    case "Contatti.jsp":
        pos=3
        break;
    case "SignIn.jsp":
        pos=4
        break;
    case "Login.jsp":
        pos=5
        break;

    case "":
        pos = 0
        break;

    default:
        // tutte le pagine di attività che perà non hanno il corrispondente sottotag nel menu
        pos=2;
        break;
}
 // modifica l'header
let links = (document.getElementById("header")).getElementsByTagName("a")
links.item(pos).id="selected"