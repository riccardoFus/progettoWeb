// Aggiorna la frase nell'intestazione delle pagine ogni 20 secondi
function updatePhrase() {
    let jsonObject;
    let URL = window.location.origin + '/' + window.location.pathname.split('/')[1] + '/PhraseFetcher';
    let xhttp = new XMLHttpRequest();

    xhttp.open("GET", URL, true);
    xhttp.responseType = "json";

    // richiamo la servlet PhraseFetcher e ricevo una frase casualmente
    xhttp.onreadystatechange = function () {
        let done = 4, ok = 200;
        if (this.readyState === done && this.status === ok) {
            jsonObject = this.response;

            document.getElementById("phraseHeader").innerText = jsonObject.frase;
        }
    };

    xhttp.send();
}

// aggiorno la frase ogni 20 secondi, al primo accesso lo faccio istantaneamente
updatePhrase();
window.setInterval(updatePhrase, 20000);


/* Script per tenere slezionata la parte di pagina dove ti trovi nell'header (grafica)*/

let pos = 0
// togli session id se presente per evitare di leggere anche quello
let noSessionId = window.location.pathname.split(";")[0];
let path = noSessionId.split("/")[2];

// in base alla pagina in cui mi trovo, cambio il selected dell'item nell'header
if(path.search("Home") !== -1 || path === ""){
    pos=0
}else if(path.search("ChiSiamo") !== -1){
    pos=1
}else if(path.search("Contatti") !== -1){
    pos=3

}else if(path.search("AreaPersonale") !== -1 || path.search("SignIn") !== -1){
    pos = 4
}else if(path.search("Login") !== -1){
    pos=5
}else{
    pos=2
}

// modifica l'header
let links = (document.getElementById("header")).getElementsByTagName("a")
links.item(pos).id="selected"

// funzione richiamata nel caso di logout (caso con cookie)
async function logout(btn, url){
    //fetch
    // evito il redirect alla home page direttamente ma attendo la risposta della servlet
    event.preventDefault()

    await fetch(url, {
        method: "POST",
        headers: {
            "Content-Type": "application/json",
            "Accept": "application/json"
        },
        body: JSON.stringify({
            "operazione": "logout"
        })
    }).then(resp => resp.json())
        .then(respInfo => {
                if(respInfo.msg === "Logout completato") {
                    // sposto l'utente alla home page, attenzione all'url rewriting
                    console.log(respInfo)
                    if(respInfo.consenso === "false"){
                        document.location.replace(btn.href+ ";jsessionid="+respInfo.id)

                    }else
                        document.location.replace(btn.href)
                }
            }
        )


}